using Microsoft.Extensions.Configuration;
using Microsoft.VisualBasic;
using MSV.Application.Bas.Encrypt;
using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace MSV.Application.Bas.Function
{
    public class Function
    {
        public string Enc2x(string txt)
        {
            if (!string.IsNullOrEmpty(txt))
            {
                for (var i = 0; i < 2; i++)
                {
                    txt = Encriptar(txt);
                }
            }
            return txt;
        }

        public string Dec2x(string txt)
        {
            if (!string.IsNullOrEmpty(txt))
            {
                for (var i = 0; i < 2; i++)
                {
                    txt = Decriptar(txt);
                }
            }
            return txt;
        }

        public string Encriptar(string textoNormal)
        {
            using (Rijndael algoritmo = CriarInstanciaRijndael())
            {
                ICryptoTransform encryptor =
                    algoritmo.CreateEncryptor(
                        algoritmo.Key, algoritmo.IV);

                using (MemoryStream streamResultado =
                       new MemoryStream())
                {
                    using (CryptoStream csStream = new CryptoStream(streamResultado, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter writer =
                            new StreamWriter(csStream))
                        {
                            writer.Write(textoNormal);
                        }
                    }

                    return ArrayBytesToHexString(
                        streamResultado.ToArray());
                }
            }
        }

        public string Decriptar(string textoEncriptado)
        {
            using (Rijndael algoritmo = CriarInstanciaRijndael())
            {
                ICryptoTransform decryptor =
                    algoritmo.CreateDecryptor(
                        algoritmo.Key, algoritmo.IV);

                string textoDecriptografado = null;
                using (MemoryStream streamTextoEncriptado =
                    new MemoryStream(
                        HexStringToArrayBytes(textoEncriptado)))
                {
                    using (CryptoStream csStream = new CryptoStream(
                        streamTextoEncriptado, decryptor,
                        CryptoStreamMode.Read))
                    {
                        using (StreamReader reader =
                            new StreamReader(csStream))
                        {
                            textoDecriptografado =
                                reader.ReadToEnd();
                        }
                    }
                }

                return textoDecriptografado;
            }
        }

        private Rijndael CriarInstanciaRijndael()
        {
            string chave = charlie();
            string vetorInicializacao = victor();
            if (!(chave != null &&
                  (chave.Length == 16 ||
                   chave.Length == 24 ||
                   chave.Length == 32)))
            {
                throw new Exception(
                    "A chave de criptografia deve possuir " +
                    "16, 24 ou 32 caracteres.");
            }

            if (vetorInicializacao == null ||
                vetorInicializacao.Length != 16)
            {
                throw new Exception(
                    "O vetor de inicialização deve possuir " +
                    "16 caracteres.");
            }

            Rijndael algoritmo = Rijndael.Create();
            algoritmo.Key = Encoding.ASCII.GetBytes(chave);
            algoritmo.IV = Encoding.ASCII.GetBytes(vetorInicializacao);

            return algoritmo;
        }

        private byte[] HexStringToArrayBytes(string conteudo)
        {
            int qtdeBytesEncriptados =
                conteudo.Length / 2;
            byte[] arrayConteudoEncriptado =
                new byte[qtdeBytesEncriptados];
            for (int i = 0; i < qtdeBytesEncriptados; i++)
            {
                arrayConteudoEncriptado[i] = Convert.ToByte(
                    conteudo.Substring(i * 2, 2), 16);
            }

            return arrayConteudoEncriptado;
        }

        private string ArrayBytesToHexString(byte[] conteudo)
        {
            string[] arrayHex = Array.ConvertAll(
                conteudo, b => b.ToString("X2"));
            return string.Concat(arrayHex);
        }

        public string charlie()
        {
            IConfigurationRoot configuration = new ConfigurationBuilder()
                   .SetBasePath(Path.Combine(Directory.GetCurrentDirectory()))
                   .AddJsonFile("appsettings.json")
                   .Build();

            var enc = new Encrypt();
            return enc.Dec3x(configuration.GetSection("Encrypt:CHARLIE").Value.ToString());
        }

        public string victor()
        {
            IConfigurationRoot configuration = new ConfigurationBuilder()
                  .SetBasePath(Path.Combine(Directory.GetCurrentDirectory()))
                  .AddJsonFile("appsettings.json")
                  .Build();

            var enc = new Encrypt();
            return enc.Dec3x(configuration.GetSection("Encrypt:VICTOR").Value.ToString());
        }

        public static bool ValidaDadosToken(string grant_type, string client_id, string client_secret, ref string username)
        {
            IConfigurationRoot configuration = new ConfigurationBuilder()
              .SetBasePath(Path.Combine(Directory.GetCurrentDirectory()))
              .AddJsonFile("appsettings.json")
              .Build();

            string loginDecryp = EncryptCflib.Decrypt(username).Result;

            if (loginDecryp.Contains("="))
            {
                username = loginDecryp.Split("=")[1].Replace("\"", "");
            }

            string grant_typeApp = configuration.GetSection("Bas:Token:grant_type").Value.ToString();
            string client_idApp = configuration.GetSection("Bas:Token:client_id").Value.ToString();
            string client_secretApp = configuration.GetSection("Bas:Token:client_secret").Value.ToString();

            if(grant_typeApp != grant_type || client_idApp != client_id || client_secretApp != client_secret)
            {
                return false;
            }

            return true;
        }
    }

    public class Encrypt
    {
        #region Rijndael Encryption

        public string Chave()
        {
            return "ku?3M8na-%3s;-:WS!-w=AZ-8gz.m:S*"; //const string chave
        }
        public string Vetor()
        {
            return "mJ9$9n!L:RbNUfm5"; //const string vetorInicializacao
        }


        private Rijndael CriarInstanciaRijndael()
        {
            string chave = Chave();
            string vetorInicializacao = Vetor();

            if (!(chave != null &&
                  (chave.Length == 16 ||
                   chave.Length == 24 ||
                   chave.Length == 32)))
            {
                throw new Exception(
                    "A chave de criptografia deve possuir " +
                    "16, 24 ou 32 caracteres.");
            }

            if (vetorInicializacao == null ||
                vetorInicializacao.Length != 16)
            {
                throw new Exception(
                    "O vetor de inicialização deve possuir " +
                    "16 caracteres.");
            }

            Rijndael algoritmo = Rijndael.Create();
            algoritmo.Key =
                Encoding.ASCII.GetBytes(chave);
            algoritmo.IV =
                Encoding.ASCII.GetBytes(vetorInicializacao);

            return algoritmo;
        }

        public string Encriptar(string textoNormal)
        {
            if (String.IsNullOrWhiteSpace(textoNormal))
            {
                throw new Exception("O conteúdo a ser encriptado não pode ser uma string vazia.");
            }

            using (Rijndael algoritmo = CriarInstanciaRijndael())
            {
                ICryptoTransform encryptor =
                    algoritmo.CreateEncryptor(
                        algoritmo.Key, algoritmo.IV);

                using (MemoryStream streamResultado =
                       new MemoryStream())
                {
                    using (CryptoStream csStream = new CryptoStream(
                        streamResultado, encryptor,
                        CryptoStreamMode.Write))
                    {
                        using (StreamWriter writer =
                            new StreamWriter(csStream))
                        {
                            writer.Write(textoNormal);
                        }
                    }

                    return ArrayBytesToHexString(
                        streamResultado.ToArray());
                }
            }
        }

        public string Enc2x(string txt)
        {
            if (!string.IsNullOrEmpty(txt))
            {
                for (var i = 0; i < 2; i++)
                {
                    txt = Encriptar(txt);
                }
            }
            return txt;
        }

        public string Dec2x(string txt)
        {
            if (!string.IsNullOrEmpty(txt))
            {
                for (var i = 0; i < 2; i++)
                {
                    txt = Decriptar(txt);
                }
            }
            return txt;
        }

        public string Enc3x(string txt)
        {
            if (!string.IsNullOrEmpty(txt))
            {
                for (var i = 0; i < 3; i++)
                {
                    txt = Encriptar(txt);
                }
            }
            return txt;
        }

        public string Dec3x(string txt)
        {
            if (!string.IsNullOrEmpty(txt))
            {
                for (var i = 0; i < 3; i++)
                {
                    txt = Decriptar(txt);
                }
            }
            return txt;
        }

        private string ArrayBytesToHexString(byte[] conteudo)
        {
            string[] arrayHex = Array.ConvertAll(
                conteudo, b => b.ToString("X2"));
            return string.Concat(arrayHex);
        }

        public string Decriptar(string textoEncriptado)
        {
            if (String.IsNullOrWhiteSpace(textoEncriptado))
            {
                throw new Exception("O conteúdo a ser decriptado não pode ser uma string vazia.");
            }

            if (textoEncriptado.Length % 2 != 0)
            {
                throw new Exception("O conteúdo a ser decriptado é inválido.");
            }

            using (Rijndael algoritmo = CriarInstanciaRijndael())
            {
                ICryptoTransform decryptor =
                    algoritmo.CreateDecryptor(
                        algoritmo.Key, algoritmo.IV);

                string textoDecriptografado = null;
                using (MemoryStream streamTextoEncriptado =
                    new MemoryStream(
                        HexStringToArrayBytes(textoEncriptado)))
                {
                    using (CryptoStream csStream = new CryptoStream(
                        streamTextoEncriptado, decryptor,
                        CryptoStreamMode.Read))
                    {
                        using (StreamReader reader =
                            new StreamReader(csStream))
                        {
                            textoDecriptografado =
                                reader.ReadToEnd();
                        }
                    }
                }

                return textoDecriptografado;
            }
        }

        private byte[] HexStringToArrayBytes(string conteudo)
        {
            int qtdeBytesEncriptados =
                conteudo.Length / 2;
            byte[] arrayConteudoEncriptado =
                new byte[qtdeBytesEncriptados];
            for (int i = 0; i < qtdeBytesEncriptados; i++)
            {
                arrayConteudoEncriptado[i] = Convert.ToByte(
                    conteudo.Substring(i * 2, 2), 16);
            }

            return arrayConteudoEncriptado;
        }
        #endregion
    }
}
