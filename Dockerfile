FROM node:24-bookworm-slim

WORKDIR /app

RUN npm config set registry https://registry.npmmirror.com/ && \
    yarn config set registry https://registry.npmmirror.com/

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile && \
    yarn cache clean

COPY . .
