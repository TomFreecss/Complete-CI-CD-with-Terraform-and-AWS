FROM    node:18-alpine #node > 16.9 is needed to connect because of (Object.hasOwn)
WORKDIR usr/app
COPY    package.json .
RUN     npm install
COPY    . .
EXPOSE  8080
CMD     ["node", "app.js"]