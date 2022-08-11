## How to use this repository
After cloning this repo you can use it in one of two ways for developing ROS packages. 

The best way to do so is by using VSCode and the VSCode remote containers extension. This will build the container for you so you won't have to run any docker cli commands. From there you click "New Terminal" which will open an interactive terminal inside the container, where you can then run your ROS programs

Another less-efficient way would be to build and start the container manually using docker CLI commands and run an interactive terminal inside it, and run your ROS programs from there

In both cases, you will need to place your ROS packages in either the dev_ws/src folder in your actual repository folder or to the dev_ws/src folder in the container itself. Which one you place it in doesn't matter, as a docker volume will be bind-mounted between the dev_ws in the repository and the /dev_ws folder in the container, so changes will show up in both. 

## VSCode Remote Containers
The VSCode Remote containers extension as mentioned is the best way to use this repository. With this extension, you can essentially develop using VSCode inside the container. 

Provided you have the extension, you can run the dev container by opening the repository in VSCode and clicking the popup which asks if you want to run the project in a devcontainer. Alternatively you can click on the VSCode remote window icon and click reopen in container to do the same

This method relies on the use of the Dockerfile, the docker-compose.yml file, and the .devcontainer.json file. 

If you want to add or develop with your own VSCode extensions, simply edit the list of extensions found in .devcontainer.json by manually changing them there or by clicking on the gear icon for an extension and clicking the "add extension to devcontainer" option, which will automatically add the extension to the file.

If you want to set up your container in a more specific way or use a different docker image, edit the Dockerfile to do so or switch to a branch that uses a different image. Currently the main branch of this repository uses the ros:humble image in its Dockerfile

Finally the docker-compose.yml file can be edited to change where the devcontainer extension mounts the bind volume. Note that the purpose of this docker-compose yaml file is really to just do that, and not for orchestration of multiple containers. This is because setting the default volume mount for the devcontainer was easier to do via the use of Docker compose. For more information see this page: https://stackoverflow.com/questions/55970168/how-to-change-default-volume-mount-in-vs-code-remote-container

## Using Docker CLI and a different editor

If you prefer programming your ROS packages in something other than VSCode, then you will need to manually build the docker image and create the container to do so. This method will only rely on the use of the Dockerfile, as the docker-compose.yml file and the .devcontainer.json files are only used in creating the devcontainer and not anything else

You will need to open up a terminal inside the folder containing the Dockerfile. Before running these commands, replace ros-tag with your desired tag for the ros image you want, and replace your-container and your-img-name with your desired image and container names. If you fail to specify a tag, the default image built will be ros:humble

### Build

```bash
docker build --build-arg tag=ros-tag -t your-img .
```
### Run

```bash
docker run --mount type=bind,source="$(pwd)"/dev_ws,target=/dev_ws --rm -it your-img bash
```
### Run Detached
If you would like to run this as a detached container and start a bash shell in it later, you will need to use the -d and --name options

```bash
docker run --name your-container -d --mount type=bind,source="$(pwd)"/dev_ws,target=/dev_ws --rm -it your-img bash
```
Then to start a bash shell in the the container run the following command:

```bash
docker exec -it your-container bash
```

## License
[MIT](https://choosealicense.com/licenses/mit/)