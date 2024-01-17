FROM node:20.11.0-bookworm

WORKDIR /app

RUN <<EOF
    npm -g install playwright@latest
    npx playwright install
    npx playwright install-deps
EOF

CMD ["npx", "playwright", "test", "--browser", "all"]
COPY . /app

RUN <<EOF
    npm install
    cp badssl-com.pem /usr/local/share/ca-certificates/badssl-com.crt
    #update-ca-certificates
EOF