# https://codefresh.io/docker-tutorial/node_docker_multistage/
# https://vuejs.org/v2/cookbook/dockerize-vuejs-app.html
FROM node:14.17.4-alpine as base_image

# make the 'app' folder the current working directory
WORKDIR /app

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./

#------------------------------------------------#

FROM base_image as dependencies

# TODO: We don't have a production mode... yet
# install project dependencies
# RUN npm ci --only=production

# copy production node_modules aside
# RUN cp -R node_modules prod_node_modules

# install ALL node_modules, including 'devDependencies'
RUN npm ci

#------------------------------------------------#

FROM dependencies as test

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

# TODO: Add tests!
# RUN  npm run lint && npm run build && npm run test
RUN npm run lint && npm run build

#------------------------------------------------#

FROM base_image AS release

COPY --from=dependencies /app/node_modules ./node_modules

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

# build app for production with minification
RUN npm run build

# Run server as node user, not root
USER node

# Expose port 8080 to the outside world
EXPOSE 8080
CMD [ "npm", "run", "serve"]