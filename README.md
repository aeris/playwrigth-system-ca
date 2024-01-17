# Build a minimal example with a custom system CA
$ docker build . -t playwright-test

# Verify custom system CA is deployed
$ docker run --rm playwright-test curl https://untrusted-root.badssl.com/
$ docker run --rm playwright-test wget https://untrusted-root.badssl.com/
# No error, curl/wget use the deployed CA

# Run playwright test, but seems browsers don't use system certificates
$ docker run --rm playwright-test
# Error, Chromium & Firefox use a predefined CA set
Chromium => Error: page.goto: net::ERR_CERT_AUTHORITY_INVALID at https://untrusted-root.badssl.com/
Firefox => Error: page.goto: SEC_ERROR_UNKNOWN_ISSUER
# Webkit seems using the system one
Webkit => OK

# Commenting line 17 on Dockerfile regenerate the image without the custom system CA
# and then Webkit fail too
Webkit => Error: page.goto: Unacceptable TLS certificate
