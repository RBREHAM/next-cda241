FROM debian:12 AS nodejs-my-website

LABEL org.opencontainers.image.source="https://github.com/RBREHAM/next-cda241"

RUN apt-get update -yq \
&& apt-get install curl gnupg -yq \
&& curl -sL https://deb.nodesource.com/setup_24.x | bash \
&& apt-get install nodejs -yq \
&& apt-get clean -y

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install --no-optional --verbose

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "start"]