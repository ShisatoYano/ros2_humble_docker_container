# ros2_humble_docker_container
A repository to create a docker container of ROS 2 Humble with NVIDIA GPU.  

## Requirements
Please install the following applications on your host Linux in advance.  

* [Visual Studio Code](https://code.visualstudio.com/Download)  
* [Docker and Docker Compose](https://docs.docker.com/engine/install/ubuntu/)  
* NVIDIA driver
* NVIDIA container toolkit

Additionally, please the following VSCode extentions.  

* [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)  
* [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)  

## How to use
1. Clone this repository and move to the root directory  
```bash
$ git clone https://github.com/ShisatoYano/ros2_humble_docker_container.git
$ cd ros2_humble_docker_container
```

2. Build an image, create and run a container by using the following scripts depend on your purpose.  

When you build the image for the first time and run the container  
```bash
$ . initial_build_run_container.sh
```
When you just run the container  
```bash
$ . run_container.sh
```
When you change the Dockerfile or docker-compose.yml and recreate the container  
```bash
$ . rebuild_run_container.sh
```
When you stop and remove the container  
```bash
$ . remove_container.sh
```

3. After the container started running, you can enter and work in the container by using VSCode extentions, Dev Containers. Firstly, you can confirm the container was created on your VSCode.  
![](/images/Screenshot%20from%202024-04-26%2015-59-51.png)  
Secondly, right click on the container's name and select "Attach in Current Window" or "Attach in New Window". After that, you can enter into the container and open a directory of ROS 2 workspace as follow.  
![](/images/Screenshot%20from%202024-04-26%2016-06-39.png)  
Finally, you can see and work in the ROS 2 workspace like this.  
![](/images/Screenshot%20from%202024-04-26%2016-10-02.png)  

4. If you just want to enter into the container and don't need to open your VSCode GUI, you can enter by using this script.  
![](/images/Screenshot%20from%202024-04-26%2016-23-16.png)  
