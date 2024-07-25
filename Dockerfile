# build stage
FROM node:lts-alpine@sha256:4795fa9fb72c020aee849a794a35b9a0aaeb7b4f0cd2a4f00fac096a7da85195 as build-stage
WORKDIR /app
COPY package.json ./
COPY yarn.lock ./
RUN yarn install --prod
COPY . .
RUN yarn run build

# production stage
FROM nginx:stable-alpine@sha256:33001975a6ea5a2b78d108b64bdc89b434e31f523d3bc641ca2a3136d9024df8 as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]