FROM rust:1.50.0 AS build
WORKDIR /usr/app

# Download the target for static linking.
RUN cargo install wasm-pack
COPY ./pkg ./pkg
COPY ./src ./src
COPY ./www ./www
COPY ./Cargo.toml ./Cargo.toml
COPY ./Cargo.lock ./Cargo.lock

RUN wasm-pack build

FROM node:15-alpine
WORKDIR /usr/app
COPY --from=build /usr/app/www  ./www
COPY --from=build /usr/app/pkg ./pkg
WORKDIR /usr/app/www
RUN npm install --production
# USER 1000
EXPOSE 8080
CMD ["npm","run", "start:dev"]
