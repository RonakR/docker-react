FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# A new FROM statement signals another block

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# Default command on nginx container takes care of starting nginx
