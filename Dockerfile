# build phase
FROM node:alpine as builder
WORKDIR "/app"
COPY . .
RUN npm install
RUN npm run build

# serve with nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
