FROM node:12

WORKDIR /usr/src/nodeapp

COPY . .

# build production only npm dependencies
RUN npm install --only=production

EXPOSE 8080

CMD ["node", "app.js"]
