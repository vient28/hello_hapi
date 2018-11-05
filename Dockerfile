# use the latest node LTS release
FROM node:carbon
WORKDIR /usr/src/app

# copy package.json and package-lock.json and install packages. we do this
# separate from the application code to better use docker's caching
# `npm install` will be cached on future builds if only the app code changed
COPY package*.json ./
RUN echo "-----BEGIN CERTIFICATE-----" >> samsung.crt
RUN echo "MIIDOjCCAqOgAwIBAgIJANFTO5wCiEk6MA0GCSqGSIb3DQEBBQUAMIG1MQswCQYD" >> samsung.crt
RUN echo "VQQGEwJTRzESMBAGA1UECAwJU2luZ2Fwb3JlMSAwHgYDVQQHDBdNYXBsZXRyZWUg" >> samsung.crt
RUN echo "QnVzaW5lc3MgQ2l0eTENMAsGA1UECgwEU0FQTDEhMB8GA1UECwwYUmVnaW9uYWwg">> samsung.crt
RUN echo "R0EgJiBTZWN1cml0eSBHMRowGAYDVQQDDBFTQU1TVU5HIFNJTkdBUE9SRTEiMCAG">> samsung.crt
RUN echo "CSqGSIb3DQEJARYTeW91bi5oc0BzYW1zdW5nLmNvbTAeFw0xMjExMDYwMDM2MTha">> samsung.crt
RUN echo "Fw0yMjExMDQwMDM2MThaMIG1MQswCQYDVQQGEwJTRzESMBAGA1UECAwJU2luZ2Fw">> samsung.crt
RUN echo "b3JlMSAwHgYDVQQHDBdNYXBsZXRyZWUgQnVzaW5lc3MgQ2l0eTENMAsGA1UECgwE">> samsung.crt
RUN echo "U0FQTDEhMB8GA1UECwwYUmVnaW9uYWwgR0EgJiBTZWN1cml0eSBHMRowGAYDVQQD">> samsung.crt
RUN echo "DBFTQU1TVU5HIFNJTkdBUE9SRTEiMCAGCSqGSIb3DQEJARYTeW91bi5oc0BzYW1z">> samsung.crt
RUN echo "dW5nLmNvbTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEA5JRb9HxmzbCuuwNt">> samsung.crt
RUN echo "45py3s4wT1TZMvK1KtXZOzjmxNPLoWCT+CRuf/ychEb3x/eqyZ9Yt9YxAAnWZ5xD">> samsung.crt
RUN echo "5aiymf9PufOnYZqVQxZ/3UAW6D+kGd6jYTYvUs80IuvuNOI3/2xOYgfN361wKZ2f">> samsung.crt
RUN echo "/ptIi/DtSXpeKItxLHDwFROorTkCAwEAAaNQME4wHQYDVR0OBBYEFM/2sX7/Ea8F">> samsung.crt
RUN echo "EYht2c63MyhKM9m9MB8GA1UdIwQYMBaAFM/2sX7/Ea8FEYht2c63MyhKM9m9MAwG">> samsung.crt
RUN echo "A1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEFBQADgYEAIMqPGSVDnKHhMNKDRHZt8Ms8">> samsung.crt
RUN echo "m8Tpz7+GT1tP6HwHVZ3nrW5zDypBVZ2AxKar5CibOaq37MvpEAEvGtxgslK+C7dB">> samsung.crt
RUN echo "f1OPURaMtg4cMOgbQSbzzIyZvF7K4+YSiUfJSQHPAUpkFvNuOnrrof4yjeyIV53T">> samsung.crt
RUN echo "3ggYvrJXAg0s2p52/1k=">> samsung.crt
RUN echo "-----END CERTIFICATE-----">> samsung.crt
RUN mv samsung.crt /usr/local/share/ca-certificates/ && update-ca-certificates
RUN npm install

# copy the app
COPY . .

# expose port 3000 and start the app
EXPOSE 3000
CMD [ "npm", "start" ]

