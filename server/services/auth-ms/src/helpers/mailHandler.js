const nodemailer = require("nodemailer");

const transporter = nodemailer.createTransport({
    host: process.env.MAIL_HOST_SMTP,
    port: process.env.MAIL_PORT,
    secure: process.env.MAIL_SECURE === "true", // true for 465, false for other ports
    auth: {
        user: process.env.MAIL_USER,
        pass: process.env.MAIL_PW,
    },
});

const sendConfirmationEmail = async (user, jwt, confirmEmailTemplate, errorHandler) => {
    try {
        const jwtPayload = { id: user.id, email: user.email };
        const token = jwt.sign(jwtPayload, process.env.CONFIRM_MAIL_SECRET_KEY, {
            expiresIn: "365d",
        });

        const confirmationUrl = `${process.env.GATEWAY_URL}/auth/verify?id=${token}`;

        const mailOptions = {
            from: process.env.MAIL_USER,
            to: user.email.trim(),
            subject: "Confirm E-Mail",
            html: confirmEmailTemplate(confirmationUrl),
        };

        const emailResult = await transporter.sendMail(mailOptions);

        if (!emailResult.accepted || emailResult.accepted.length === 0) {
            throw new Error("email-not-sent");
        }

        return true;
    } catch (error) {
        await errorHandler(500, error.message || "email-not-sent", false);
        throw error;
    }
};

const sendResetEmail = async (recipientEmail, emailContent) => {
    try {
        const info = await transporter.sendMail({
            from: `"Support-Team" <${process.env.MAIL_USER}>`,
            to: recipientEmail,
            subject: "Reset Your Password",
            html: emailContent,
        });

        return info.accepted.includes(recipientEmail);
    } catch (error) {
        console.error("sending email failed:", error);
        return false;
    }
};

module.exports = { sendConfirmationEmail, sendResetEmail, };