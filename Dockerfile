FROM redhat/ubi9

USER root
RUN dnf update -y && \
    dnf install -y curl && \
    dnf install -y nodejs && \
    dnf clean all

WORKDIR /app
COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]