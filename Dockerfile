FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .

FROM node:18 AS production
WORKDIR /app
COPY --from=base /app /app
EXPOSE 3000
CMD ["node", "app.js"]
