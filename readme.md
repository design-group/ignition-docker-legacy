```
services:
  gateway:
    image: kgamble/ignition:latest
    ports:
      - 80:8088
    # # In order to use this volume, you must first create the directory `data-folder` next to the docker-compose.yml file
    # volumes:
    #   - ./data-folder:/workdir
```
