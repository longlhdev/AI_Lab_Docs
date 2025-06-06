# Integration API Signature


## Required Headers

Each API request must include the following **headers**:

| Header              | Required | Description |
|---------------------|----------|-------------|
| `App-Name`          | ✅       | The name of your application. Used for debugging and logging failed requests. |
| `X-Api-BundleId`    | ✅       | The Bundle ID or Package Name of your app. This, together with the API Key, ensures that the key is used only by your app. |
| `X-Api-Timestamp`   | ✅       | The UTC timestamp in **milliseconds**. Used to prevent replay attacks.<br>Example: `1717490000123` |
| `X-Api-Token`       | ✅       | Used for Advanced Mobile Integrity. If not enabled, simply use: `not_get_api_token`. |
| `X-Api-Signature`   | ✅       | The computed RSA-SHA256 signature based on your request payload. |

## How to Generate

### Algorithm

- **Algorithm:** `RSA-SHA256`
- **Padding:** `RSA_PKCS1_PADDING`
- **Passphrase:** *(empty string)*

### Payload Schema

```text
{timestamp}@@@{apiKey}@@@{nonce}
```


| Elements              | Description |
|---------------------|-------------|
| `timestamp`         | Must match the value in X-Api-Timestamp. |
| `apiKey`            | Your API Key (sk-...). |
| `nonce`             | A random integer between 0 and 1,000,000. A new value must be used for every request. |


### Example


#### Node.js

```javascript
const crypto = require('crypto');
const fs = require('fs');

// Load the public key
const publicKey = fs.readFileSync('public.pem', 'utf-8');

// Prepare the payload
const payload = '1717490000123@@@sk-d3fabc1234567890@@@128311';

// Encrypt with public key
const signature = crypto.publicEncrypt(
      {
        key: publicKey,
        passphrase: '',
        padding: crypto.constants.RSA_PKCS1_PADDING,
        oaepHash: 'sha256',
      },
      Buffer.from(payload),
)

// Encode to base64
const encodedSignature = signature.toString('base64');

console.log(encodedSignature);
```

#### Python

```python
from cryptography.hazmat.primitives import serialization, hashes
from cryptography.hazmat.primitives.asymmetric import padding
import base64

# Load the public key
with open("public.pem", "rb") as key_file:
    public_key = serialization.load_pem_public_key(key_file.read())

# Prepare the payload
payload = b"1717490000123@@@sk-d3fabc1234567890@@@128311"

# Encrypt with public key
ciphertext = public_key.encrypt(
    payload,
    padding.PKCS1v15()
)

# Encode to base64
encoded_signature = base64.b64encode(ciphertext).decode("utf-8")

print(encoded_signature)
```

#### Kotlin
```kotlin
import java.security.KeyFactory
import java.security.spec.X509EncodedKeySpec
import java.util.Base64
import javax.crypto.Cipher
import java.nio.file.Files
import java.nio.file.Paths

fun main() {
    val payload = "1717490000123@@@sk-d3fabc1234567890@@@128311"
    
    // Load public key
    val publicKeyBytes = Files.readAllBytes(Paths.get("public.pem"))
    val publicKeyPEM = String(publicKeyBytes)
        .replace("-----BEGIN PUBLIC KEY-----", "")
        .replace("-----END PUBLIC KEY-----", "")
        .replace("\\s+".toRegex(), "")
    
    val decoded = Base64.getDecoder().decode(publicKeyPEM)
    val keySpec = X509EncodedKeySpec(decoded)
    val keyFactory = KeyFactory.getInstance("RSA")
    val publicKey = keyFactory.generatePublic(keySpec)

    // Encrypt with RSA/ECB/PKCS1Padding
    val cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding")
    cipher.init(Cipher.ENCRYPT_MODE, publicKey)
    val encryptedBytes = cipher.doFinal(payload.toByteArray())

    val encodedSignature = Base64.getEncoder().encodeToString(encryptedBytes)
    println(encodedSignature)
}
```

