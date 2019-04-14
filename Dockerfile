FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# Copy only the folder /app/build and forget everithing befor importing nginx
COPY --from=builder /app/build /usr/share/nginx/html
