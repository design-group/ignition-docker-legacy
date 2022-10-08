

## Design Group Template Image

The purpose of this image is to provide a quick way to spin up docker containers that include some necessary creature comforts for version control, theme management, and easy interaction with the required file system components for an Ignition gateway.

This image is automatically built for versions 8.1.13-8.1.21, new versions will be updated, but any features are subject to change with later versions.

If using a windows device, you will want to [Set up WSL](docs/setting-up-wsl.md)

## File Access
This custom build creates a symlink in the `/workdir` directory to a few of the components in Ignition's `data` directory. This allows you to easily access the files on the host system, and simplifies the necessary `.gitignore` for a project. The following items are symlinked by default, and these are the environment variables that enable them:
| Symlink Path | Environment Variable |
| --- | --- |
| `/usr/local/bin/ignition/data/projects` | `SYMLINK_PROJECTS` |
| `/usr/local/bin/ignition/data/modules/com.inductiveautomation.perspective` | `SYMLINK_THEMES` |
| `/usr/local/bin/ignition/data/ignition.conf` | `SYMLINK_CONF` |
| `/usr/local/bin/ignition/data/logback.xml` | `SYMLINK_LOGBACK` |

To disable one of the symlinks, set the environment variable to `false`. For example, to disable the symlink to the `projects` directory, set `SYMLINK_PROJECTS=false`

#### Note for Windows/Linux Users
In order for the symlinks to work, you must first create an empty folder adjacent to the `docker-compose.yml` file that has the same name as the desired bind mount. On Windows/Linux docker will automatically do everything as `root`, so without doing this the created file will be owned by `root:root` instead of `user:user`. On a Mac, this is not necessary, MacOS ftw.

## Customizations
This is a derived image of the `inductiveautomation/ignition` image. Please see the [Ignition Docker Hub](https://hub.docker.com/r/inductiveautomation/ignition) for more information on the base image. This image should be able to take all arguments provided by the base image, but has not been tested.

### Environment Variables
This image also preloads the following environment variables by default:
| Environment Variable | Min-Version | Value | 
| --- | --- | --- |
| `ACCEPT_IGNITION_EULA` | 8.1.13 | `Y` | 
| `GATEWAY_ADMIN_USERNAME` | 8.1.13 | `admin` |
| `GATEWAY_ADMIN_PASSWORD` | 8.1.13 | `password` |
| `IGNITION_EDITION` | 8.1.13 | `standard` |
| `GATEWAY_MODULES_ENABLED` | 8.1.17 | `alarm-notification,allen-bradley-drivers,bacnet-driver,opc-ua,perspective,reporting,tag-historian,web-developer` |
| `IGNITION_UID` | 8.1.13 | `1000` |
| `IGNITION_GID` | 8.1.13 | `1000` |
| `PROJECT_SCAN_FREQUENCY` | 8.1.13 | `10` |
| `SYMLINK_CONF` | 8.1.13 | `true` |
| `SYMLINK_LOGBACK` | 8.1.13 | `true` |
| `SYMLINK_PROJECTS` | 8.1.13 | `true` |
| `SYMLINK_THEMES` | 8.1.13 | `true` |

### ignition.conf
The included `ignition.conf` file is configured to scan projects at the rate provided by the `PROJECT_SCAN_FREQUENCY` environment variable to optimize for version controlled projects. Currently to use the `PROJECT_SCAN_FREQUENCY` environment variable, you must also use the `SYMLINK_CONF` symlink.

### logback.xml
The included `logback.xml` file is a default file, it is just mapped into the working directory so that it can be customized if desired.

### Example docker-compose file
```yaml
services:
  gateway:
    image: bwdesigngroup/ignition:8.1.21
    ports:
      - 80:8088
    # # In order to use this volume, you must first create the directory `data-folder` next to the docker-compose.yml file
    # volumes:
    #   - ./data-folder:/workdir
```

### Requests
If you have any requests for additional features, please feel free to open an issue on the [GitHub Repo](https://github.com/design-group/ignition-docker) or submit a pull request.