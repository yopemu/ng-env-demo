#stage 1
FROM node:latest
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:latest
COPY --from=node /app/dist/ng-env-demo /usr/share/nginx/html
EXPOSE 80
