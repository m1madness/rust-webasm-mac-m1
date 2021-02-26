FROM rust:1.50.0 AS build
WORKDIR /usr/app

# Download the target for static linking.
RUN cargo install wasm-pack
COPY . .
RUN wasm-pack build

FROM node:15-alpine
WORKDIR /usr/app
COPY --from=build /usr/app/. .
WORKDIR /usr/app/www
RUN npm install --production
# USER 1000
EXPOSE 8080
CMD ["npm","run", "start:dev"]
