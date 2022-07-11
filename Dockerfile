#stage 1
FROM node:latest as build
WORKDIR /usr/local/app
COPY ./ /usr/local/app/

RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:latest
COPY --from=build /usr/local/app/dist/ng-env-demo /usr/share/nginx/html
CMD ["/bin/sh",  "-c",  "envsubst < /usr/share/nginx/html/assets/environments/env.template.js > /usr/share/nginx/html/assets/environments/env.js"]
EXPOSE 80
