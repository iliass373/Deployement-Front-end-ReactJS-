#### FIRST IMAGE

# BASE IMAGE
FROM node:alpine as builder
WORKDIR '/app'

# DEPENDECIES AND CREATE THE BUILD FOLDER 
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build
RUN npm install 


##### SECOND IMAGE 
FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html 