

## Design Group Template Image

The purpose of this image is to provide a quick way to spin up docker containers that include some necessary creature comforts for version control, theme management, and easy interaction with the required file system components for an Ignition gateway.

If using a windows device, you will want to [Set up WSL](docs/setting-up-wsl.md)

## File Access
This custom build creates a symlink in the `/workdir` directory to a few of the components in Ignition's `data` directory. This allows you to easily access the files on the host system, and simplifies the necessary `.gitignore` for a project. The following items are symlinked:
- `/usr/local/bin/ignition/data/projects`
- `/usr/local/bin/ignition/data/modules/com.inductiveautomation.perspective`
- `/usr/local/bin/ignition/data/ignition.conf`
- `/usr/local/bin/ignition/data/logback.xml`

#### Note for Windows/Linux Users
In order for the symlinks to work, you must first create an empty folder adjacent to the `docker-compose.yml` file that has the same name as the desired bind mount. On Windows/Linux docker will automatically do everything as `root`, so without doing this the created file will be owned by `root:root` instead of `user:user`. On a Mac, this is not necessary, MacOS ftw.

## Customizations
This is a derived image of the `inductiveautomation/ignition` image. Please see the [Ignition Docker Hub](https://hub.docker.com/r/inductiveautomation/ignition) for more information on the base image. This image should be able to take all arguments provided by the base image, but has not been tested.

This image also preloads the following environment variables by default:
| Environment Variable | Value |
| --- | --- |
| `ACCEPT_IGNITION_EULA` | `Y` |
| `GATEWAY_ADMIN_USERNAME` | `admin` |
| `GATEWAY_ADMIN_PASSWORD` | `password` |
| `IGNITION_EDITION` | `standard` |
| `GATEWAY_MODULES_ENABLED` | `alarm-notification,allen-bradley-drivers,bacnet-driver,opc-ua,perspective,reporting,tag-historian,web-developer` |
| `IGNITION_UID` | `1000` |
| `IGNITION_GID` | `1000` |


### Example docker-compose file
```yaml
services:
  gateway:
    image: design-group/ignition:8.1.20
    ports:
      - 80:8088
    # # In order to use this volume, you must first create the directory `data-folder` next to the docker-compose.yml file
    # volumes:
    #   - ./data-folder:/workdir
```

### Requests
If you have any requests for additional features, please feel free to open an issue on the [GitHub Repo](https://github.com/design-group/ignition-docker) or submit a pull request.