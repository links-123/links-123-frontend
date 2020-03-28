FROM node:12 as BUILDER

WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY package.json /app/package.json
RUN npm install --silent
RUN npm install @vue/cli -g
COPY . /app
RUN npm run build

FROM nginx:1.16.0-alpine
COPY --from=BUILDER /app/dist /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
