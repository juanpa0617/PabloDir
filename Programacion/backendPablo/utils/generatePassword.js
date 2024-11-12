const length = 10;
const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()_+~`|}{[]:;?><,./-=";

const generatePassword = () => {
  let password = "";
  let hasUpper = false;
  let hasLower = false;
  let hasSpecial = false;

  while (true) {
    password = "";
    for (let i = 0; i < length; i++) {
      const char = charset.charAt(Math.floor(Math.random() * charset.length));
      password += char;
      if (/[A-Z]/.test(char)) hasUpper = true;
      if (/[a-z]/.test(char)) hasLower = true;
      if (/[@#$%^&*()_+~`|}{[$$:;?><,./-=]/.test(char)) hasSpecial = true;
    }
    if (hasUpper && hasLower && hasSpecial) break;
  }
  return password;
};

export default generatePassword;
