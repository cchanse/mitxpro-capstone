FROM node:14

# ENV PORT 3000
ENV PORT $PORT

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Installing depnpendencies
COPY package*.json /usr/src/app/
RUN npm install

# Copying source files
COPY . /usr/src/app

# Building app
RUN npm run build
# EXPOSE 3000
# Expose $PORT on container.
# We use a varibale here as the port is something that can differ on the environment.
EXPOSE $PORT

# Running the app
CMD "npm" "run" "dev" 
# CMD "npm" "run" "start"
# CMD "npm" "run" "dev" -p $PORT
# CMD "npm" "run" "dev" "-p" "$PORT"
