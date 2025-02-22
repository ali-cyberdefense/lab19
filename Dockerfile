FROM node:14-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

# Download and install oc client
RUN wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz && \
    tar -zxvf openshift-client-linux.tar.gz && \
    mv oc /usr/local/bin/ && \
    chmod +x /usr/local/bin/oc && \
    rm openshift-client-linux.tar.gz

ENV IMAGE_NAME=image-registry.openshift-image-registry.svc:5000/default/lab19-buildconfig:latest

CMD ["npm", "start"]
