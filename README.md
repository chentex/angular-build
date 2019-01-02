# angular-build

Angular v10.15.0 docker image based on openSUSE official image.

[![](https://images.microbadger.com/badges/image/chentex/angular-build.svg)](https://microbadger.com/images/chentex/angular-build "Get your own image badge on microbadger.com")

## What is Angular?

Angular helps you build modern applications for the web, mobile, or desktop.

See: [Angular](https://angular.io/)

## What is inside of this repo?

In this git repository you will find the docker image definitions for Angular 10.15.0
in openSUSE Leap 15.

* `Dockerfile`

The default user and group for this image are `node:node`

The workspace is set to `/code`

## How do I use this image?

To use this images you must do as follows:

```
# you can use tags latest, latest-centos7, latest-centos6
docker pull chentex/angular-build:10.15.0

# to run the image just execute
docker run -v /path/to/your/angular/project:/code chentex/angular-build:10.15.0 ng build --prod
```

You can use it in a multistage build for your angular application

Dockerfile
```
FROM chentex/angular-build:10.15.0 AS build
ADD --chown=node:node . /code
RUN ng build --prod

FROM chentex/docker-nginx-centos:latest AS run
COPY --from=0 /code/dist/your-application /data/www
```

## How do I build this image?

First things first, you can find these docker images in `chentex/anguar-build`
but you can also build a specific version on your own, you only need:

* docker

Clone this repo

`git clone https://github.com/chentex/anguar-build.git`

Go to the folder in your terminal and type this:

```
# build the new image
docker build -f Dockerfile .
```

If you want to tag your image use the following command

```
docker build -f Dockerfile -t yourbase/yourname:version .
```
---
For more on docker build reference to the [Documentation](https://docs.docker.com/engine/reference/commandline/build/)

You can get the source from the images in the [Repository](https://github.com/chentex/anguar-build)