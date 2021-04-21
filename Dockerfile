#### FIRST IMAGE

# BASE IMAGE
FROM node:alpine
WORKDIR '/app'

# DEPENDECIES AND CREATE THE BUILD FOLDER 
COPY package*.json ./
RUN npm install
COPY . . 
RUN npm run build
RUN npm install 


##### SECOND IMAGE 
FROM nginx 
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html 