const sendConfirmationEmail = async (user, transporter, jwt, confirmEmailTemplate, errorHandler) => {
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

module.exports = sendConfirmationEmail;