FROM node:14-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

# Update Alpine repositories
RUN apk update

# Install oc client (try a more specific package name)
RUN apk add --no-cache oc

ENV IMAGE_NAME=image-registry.openshift-image-registry.svc:5000/default/lab19-buildconfig:latest

CMD ["npm", "start"]
