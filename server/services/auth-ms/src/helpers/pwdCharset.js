function generatePasswordCharset(includeLowercase = true, includeUppercase = true, includeNumbers = true, includeSymbols = true, includeUmlauts = false) {
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

module.exports = generatePasswordCharset;