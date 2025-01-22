FROM node:16-alpine as builder


WORKDIR /app
COPY . .

RUN npm install

FROM node:16-alpine

WORKDIR /app

COPY --from=builder /app ./

RUN adduser -D safeUser

USER safeUser
