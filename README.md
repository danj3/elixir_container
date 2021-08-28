# General info
A more usable elixir container setup for development.
 * Binds a volume to a directory on your localhost.
 * Adds a few basic git shortcuts and modifies the terminal prompt in the container.

## Setup
Make sure you have the latest version of Docker installed.

Clone the repo and build the image

```
$ git clone https://github.com/danj3/elixir_container.git
$ cd elixir_container
$ chmod +x run build 
$ ./build
```

That's it! Use `$ ./run` to create a container with a volume attatched. 
Files in the container's directory will show up under `~/src` in the docker container when it's running. 


## Troubleshooting
Make sure your username id `$ id -u` is 1000

If it isn't, before building the image, modify line 10 in the Dockerfile so that it reads
```
RUN adduser -u foo -D elixir
```
and replace foo with the result of `$ id -u`
