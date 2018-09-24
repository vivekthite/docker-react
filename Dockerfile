#build stage
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm i
COPY public ./public
COPY src ./src
RUN npm run build

#deploy to nginx stage
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
