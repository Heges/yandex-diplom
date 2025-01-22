FROM node:16.20.0-alpine3.18 as builder
WORKDIR /frontend
COPY . .
RUN npm install \
    && npm run build \
    && ls -lahh \
    && ls -lahh /frontend/dist
    
FROM nginx:1.21.6-alpine
COPY --from=builder /frontend/dist /usr/share/nginx/html
EXPOSE 80
