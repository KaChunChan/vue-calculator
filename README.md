# calculator
Emulate a simple calculator that can do addition, subtraction, multiplication, and division. 

### Build Prerequisites

* [NodeJS](https://nodejs.org/en/download/) -This is build using Node LTS (14.17.4 at the time of writing)

## Project setup

Once NodeJS is installed, you should be able to run the following commands to build and run the project.

```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).

# Docker Instructions

### Build Prerequisites

* [Docker](https://www.docker.com/)

### Build Steps

1. Install Docker.
2. `cd` to `vue-calculator` dir.
3. Run `docker build -t vue-calculator:latest .`. This will build a Docker image tagged `vue-calculator:latest`. CMake and compilation will be displayed in console while building the image.
4. Run container `docker run--rm -it -p 8080:8080/tcp vue-calculator:latest`.
5. Open your favourite web browser and open `http://localhost:8080/`. Tada!