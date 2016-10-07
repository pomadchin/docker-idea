# Dockerized Intelij IDEA Community edition

Dockerized version of [Intelij IDEA Community edition](https://github.com/JetBrains/intellij-community)

## Build

Docker images are published to [Dockerhub](https://hub.docker.com/r/daunnc/idea/tags/).

```bash
docker build -t daunnc/idea:local .
```

## Run

* Runing on Linux
  ```bash
  docker run \
    -v /tmp/.X11-unix:/tmp/.X11-unix \ 
    -e DISPLAY=unix$DISPLAY \
    --name idea \
    daunnc/idea:latest
  ```

* Runing on Windows
  First you need to have a runing [X11](https://ru.wikipedia.org/wiki/X_Window_System) server, for example [Xming](http://www.straightrunning.com/XmingNotes/).
    
    ```bash
  docker run \
    -v /tmp/.X11-unix:/tmp/.X11-unix \ 
    -e DISPLAY=*your-hostmachine-ip*:0 \
    --name idea \
    daunnc/idea:latest
  ```

## License

* Licensed under the Apache License, Version 2.0: http://www.apache.org/licenses/LICENSE-2.0