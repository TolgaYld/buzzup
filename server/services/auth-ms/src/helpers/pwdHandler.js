const generateRandomPassword = () => {
    const pwdChars = generatePwdCharset(true, true, true, true, false);
    const pwdLen = 21;
    return Array(pwdLen)
        .fill(pwdChars)
        .map((x) => x[Math.floor(Math.random() * x.length)])
        .join("");
};

function generatePwdCharset(includeLowercase = true, includeUppercase = true, includeNumbers = true, includeSymbols = true, includeUmlauts = false) {
    let charset = "";

    if (includeLowercase) {
        charset += 'abcdefghijklmnopqrstuvwxyz';
    }
    if (includeUppercase) {
        charset += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    }
    if (includeNumbers) {
        charset += '0123456789';
    }
    if (includeSymbols) {
        charset += '!@#$%^&*()-_=+[]{}|;:\'",.<>/?';
    }
    if (includeUmlauts) {
        charset += "äöüÄÖÜ";
    }

    return charset;
}

module.exports = generateRandomPassword;