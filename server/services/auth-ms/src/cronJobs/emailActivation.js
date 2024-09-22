const schedule = require("node-schedule");
const { User } = require("@TolgaYld/core-buzzup");
const nodemailer = require("nodemailer");
const jwt = require("jsonwebtoken");
const reminderConfirmEmailTemplate = require("../template/reminderConfirmEmailTemplate");

schedule.scheduleJob("0 12 * * 0", async () => {
  const findAllUsers = await User.find({
    email_confirmed: false,
    is_banned: false,
    is_deleted: false,
  })
    .select("email")
    .exec();
  if (findAllUsers) {
    for (const element of findAllUsers) {
      const user = element;
      let transporter = nodemailer.createTransport({
        host: process.env.MAIL_HOST_SMTP,
        auth: {
          user: process.env.MAIL_USER,
          pass: process.env.MAIL_PW,
        },
      });

      const jwtInfos = {
        id: user.id,
        email: user.email,
      };

      const jwtToken = jwt.sign(jwtInfos, process.env.CONFIRM_MAIL_SECRET_KEY, {
        expiresIn: "180d",
      });

      const url = process.env.GATEWAY_URL + "/auth/verify?id=" + jwtToken;

      await transporter.sendMail({
        from: process.env.MAIL_USER,
        to: user.email.trim(),
        subject: "Reminder: Confirm E-Mail",
        html: reminderConfirmEmailTemplate(url),
      });
    }
  }
});

module.exports = schedule;
