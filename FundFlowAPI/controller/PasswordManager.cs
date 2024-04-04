using System;
using System.Security.Cryptography;
using Microsoft.AspNetCore.Cryptography.KeyDerivation;

namespace FundFlowAPI
{
    public class PasswordManager
    {
        public string HashPassword(string password)
        {
            // Generate a salt
            byte[] salt = new byte[16];
            using (var rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(salt);
            }

            // Hash the password with the salt
            string hashedPassword = Convert.ToBase64String(KeyDerivation.Pbkdf2(
                password: password,
                salt: salt,
                prf: KeyDerivationPrf.HMACSHA512,
                iterationCount: 10000,
                numBytesRequested: 32));

            return hashedPassword;
        }

        public bool VerifyPassword(string password, string hashedPassword)
        {
            // Extract the bytes representing the salt
            byte[] salt = Convert.FromBase64String(hashedPassword).Take(16).ToArray();

            // Compute the hash of the provided password using the extracted salt
            string hashedProvidedPassword = Convert.ToBase64String(KeyDerivation.Pbkdf2(
                password: password,
                salt: salt,
                prf: KeyDerivationPrf.HMACSHA512,
                iterationCount: 10000,
                numBytesRequested: 32));

            // Compare the computed hash with the stored hash
            return hashedProvidedPassword == hashedPassword;
        }
    }
}