FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# each block can only one FROM statement, so this servers as beggining of new block
FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html
# no need to specify cmd, nginx default command is run nginx