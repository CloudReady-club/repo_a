{
  "alg": "RS256",   // or ES256 if you used ECC in KMS
  "typ": "JWT",
  "kid": "<optional-key-id>"
}
{
  "iss": "<client_id>",                    // Your Auth0 Client ID
  "sub": "<client_id>",                    // Same as iss
  "aud": "https://<tenant>.auth0.com/",    // or token endpoint URL
  "exp": 1693668400,                       // Expiration (epoch seconds, ~5 min max)
  "jti": "<unique-random-string>"          // Prevents replay attacks
}

package main

import (
	"context"
	"crypto/sha256"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"time"

	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/kms"
)

func main() {
	// Load AWS config
	cfg, _ := config.LoadDefaultConfig(context.TODO())
	client := kms.NewFromConfig(cfg)

	// Create JWT header & payload
	header := map[string]string{
		"alg": "RS256", // depends on your KMS key type
		"typ": "JWT",
	}
	payload := map[string]interface{}{
		"iss": "YOUR_CLIENT_ID",
		"sub": "YOUR_CLIENT_ID",
		"aud": "https://YOUR_DOMAIN.auth0.com/",
		"exp": time.Now().Add(5 * time.Minute).Unix(),
		"jti": "random-uuid-or-nonce",
	}

	// Base64Url encode header & payload
	encode := func(data interface{}) string {
		b, _ := json.Marshal(data)
		return base64.RawURLEncoding.EncodeToString(b)
	}
	signedData := encode(header) + "." + encode(payload)

	// Hash the signing input
	digest := sha256.Sum256([]byte(signedData))

	// Call AWS KMS Sign
	signOutput, err := client.Sign(context.TODO(), &kms.SignInput{
		KeyId:            aws.String("arn:aws:kms:REGION:ACCOUNT:key/YOUR_KEY_ID"),
		Message:          digest[:],
		MessageType:      "DIGEST",
		SigningAlgorithm: "RSASSA_PKCS1_V1_5_SHA_256",
	})
	if err != nil {
		panic(err)
	}

	// Final JWT
	signature := base64.RawURLEncoding.EncodeToString(signOutput.Signature)
	jwt := signedData + "." + signature

	fmt.Println("JWT Assertion:", jwt)
}
