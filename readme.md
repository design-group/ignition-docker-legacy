
[![8.1 Build Status](https://github.com/thirdgen88/ignition-docker/actions/workflows/multibuild-8.1.yml/badge.svg)](https://github.com/design-group/ignition-docker/actions)
[![Docker Stars](https://img.shields.io/docker/stars/design-group/ignition-docker.svg)](https://hub.docker.com/r/design-group/ignition-docker)
[![Docker Pulls](https://img.shields.io/docker/pulls/design-group/ignition-docker.svg)](https://hub.docker.com/r/design-group/ignition-docker)
<br/>
![Ignition 8.1.21](https://img.shields.io/badge/ignition-8.1.21-brightgreen.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAEt2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iCiAgICB4bWxuczpleGlmPSJodHRwOi8vbnMuYWRvYmUuY29tL2V4aWYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iNDgiCiAgIHRpZmY6SW1hZ2VXaWR0aD0iNDgiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249IjcyLjAiCiAgIHRpZmY6WVJlc29sdXRpb249IjcyLjAiCiAgIGV4aWY6UGl4ZWxYRGltZW5zaW9uPSI0OCIKICAgZXhpZjpQaXhlbFlEaW1lbnNpb249IjQ4IgogICBleGlmOkNvbG9yU3BhY2U9IjEiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjAtMTEt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)

## Design Group Template Image

The purpose of this image is to provide a quick way to spin up docker containers that include some necessary creature comforts for version control, theme management, and easy interaction with the required file system components for an Ignition gateway.

This image is automatically built for versions 8.1.13-8.1.21, new versions will be updated, but any features are subject to change with later versions. Upon a new pull request, if a valid build file is modified, it will trigger a build test pipeline that verifies the image still operates as expected.

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