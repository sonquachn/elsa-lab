# Stage 1: Build Stage
FROM node:20-slim AS build

WORKDIR /starter
ENV NODE_ENV development

COPY package*.json /starter/

# Install dependencies based on the environment
RUN if [ "$NODE_ENV" = "production" ]; then \
    npm install --omit=dev; \
    else \
    npm install; \
    fi

# Copy the rest of the application code
COPY . /starter

# Stage 2: Production Stage
FROM node:20-slim AS production

WORKDIR /starter

# Copy only the necessary files from the build stage
COPY --from=build /starter /starter

# Install PM2 globally
RUN npm install pm2 -g

CMD ["pm2-runtime", "app.js"]

EXPOSE 8080
