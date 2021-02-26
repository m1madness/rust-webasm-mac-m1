# Game of Life on Mac M1

[Original project](https://rustwasm.github.io/docs/book/game-of-life/hello-world.html)

This repo contains all patches needed to compile game of life from rust into webasm served via nodejs

## Installation
Please install these dependencies first:

### nvm / nodejs

'brew install nvm'
'nvm install --default v15'

### Rust / cargo / wasm-pack
Install the beta  toolchain 'sh <(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs) --default-toolchain beta'
'cargo install wasm-pack'

## Building
Quick c&p: 'wasm-pack build && cd www && npm i && npm start'
1. In the root directory execute: 'wasm-pack build'
2. move to the www directory: 'cd www'
3. install the build rust package 'npm i'
4. Start with 'npm start'
5. Open browser at: 'http://localhost:8080'

## Docker

- 'docker build . -t game-of-life && docker run -it game-of-life'