# FAQ

## Introduction
This document provides details on common error codes and messages you may encounter when working with the AI service of AI Lab. It is designed to help you quickly identify and troubleshoot potential issues.


## Response Structure

### Success
```json
{
  "statusCode": 200,
  "message": "success",
  "data": {
    "url": "https://s3.ap-southeast-1.amazonaws.com/.../input.jpg?...",
    "path": "ai-core-art-generator-v2/123456789/input.jpg"
  },
  "timestamp": 1740645782843
}
```


### Error
```json
{
    "correlationId": "558f1c5a-d6a6-485c-b2a7-32dd035c41ae",
    "statusCode": 400,
    "timestamp": "2025-06-06T02:51:42.447Z",
    "path": "/api/v5/image-ai/",
    "message": "ERR06",
    "errorCode": "server.internal-error"
}
```

- **correlationId**: Used to trace requests across systems.
- **statusCode**: Indicates the HTTP status of the response.
- **timestamp**: The time at which the request was made.
- **path**: The API endpoint being accessed.
- **message**: Detailed error message.
- **errorCode**: Specific error code, aiding in swift identification and resolution of issues.


## Common Errors
### GLOBAL_TIMEOUT
- **Error Code:** `request.timeout-out`
- **Message:** A global request timeout has occurred.
- **Cause:** This typically happens when the server is overloaded or there is a significant network delay.


## Client Errors

### CLIENT_BAD_REQUEST
- **Error Code:** `client.bad-request`
- **Message:** Invalid input.
- **Cause:** Incorrect structure or missing necessary parameters.

### UNAUTHORIZED
- **Error Code:** `client.unauthorized`
- **Message:** Unauthorized access.
- **Cause:** This may occur if the authentication token is invalid or missing.

### NOT_FOUND_RESOURCE
- **Error Code:** `client.not-found`
- **Message:** Resource not found.

### FAILED_TO_FETCH_IMAGE
- **Error Code:** `client.failed-to-fetch-image`
- **Message:** Failed to fetch image.

### ROUTE_NOT_FOUND
- **Error Code:** `client.route-not-found`
- **Message:** Route not found.

## API Signature Errors

### HEADER_REQUIRE
- **Error Code:** `signature-header.require`
- **Message:** Required header missing.
- **MaskMessage:** `ERR08`

### MISSING_PARAMS
- **Error Code:** `signature-params.missing`
- **Message:** Missing signature parameters.
- **MaskMessage:** `ERR09`

### INVALID_SCHEME_PAYLOAD
- **Error Code:** `signature.invalid-scheme-payload`
- **Message:** Invalid scheme payload.
- **MaskMessage:** `ERR01`

### INVALID_KEYID
- **Error Code:** `signature.invalid-keyId`
- **Message:** Invalid KeyId.
- **MaskMessage:** `ERR02`

### INVALID_TIMESTAMP
- **Error Code:** `signature.invalid-timestamp`
- **Message:** Invalid timestamp.
- **MaskMessage:** `ERR03`

### EXPIRED
- **Error Code:** `signature.expired`
- **Message:** Signature has expired.
- **MaskMessage:** `ERR05`

### ERROR_DECRYPT
- **Error Code:** `signature.error-decrypt`
- **Message:** Error decrypting signature.
- **MaskMessage:** `ERR06`

## Server Errors

### INTERNAL_SERVER_ERROR
- **Error Code:** `server.internal-error`
- **Message:** An unexpected internal server error occurred.

### REQUEST_TIMEOUT
- **Error Code:** `server.timeout`
- **Message:** Request to server has timed out.

### LIMIT_EXCEEDED
- **Error Code:** `server.limit-exceeded`
- **Message:** Service limit exceeded.

## Connection Errors

### FAIL_API_KEY
- **Error Code:** `api-key.connection-fail`
- **Message:** Failed connection to API key service.
- **MaskMessage:** `ERR07`

