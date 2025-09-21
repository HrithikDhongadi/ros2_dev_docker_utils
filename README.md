# ROS2 Humble Development Docker Container — Usage Instructions

This guide explains **how to use** the pre-configured ROS2 Humble development environment inside a Docker container via Visual Studio Code (VSCode) **Dev Containers**. You will run and develop ROS2 code inside a container without needing to install ROS2 or all dependencies locally.

---

## What is this?

* A **Docker container** prebuilt with ROS2 Humble and development tools.
* Integrated with VSCode Dev Containers — allowing you to develop inside the container seamlessly.
* Provides an isolated and consistent environment for ROS2 development.
* Your workspace files are mounted inside the container so you can edit code on your host machine using VSCode.

---

## Folder Structure (for context)

```
.
├── .devcontainer/devcontainer.json          # Dev container config for VSCode
├── scripts/dev_docker_pull.sh               # Script to pull the Docker image from Docker Hub
├── ros2_ws/                                 # Placeholder workspace (optional)
├── .vscode/                                 # VSCode config files
├── LICENSE
└── README.md
```

---

## Prerequisites

* Install [Docker](https://docs.docker.com/get-docker/) on your machine.
* Install [Visual Studio Code](https://code.visualstudio.com/).
* Install the Remote - Containers extension from VSCode extensions page.

---

## Step 1: Pull the ROS2 Docker Image (Optional)

You can use the provided script to pull the Docker image from Docker Hub:

```bash
cd scripts
./dev_docker_pull.sh
```

> This script pulls the image `osrf/ros:humble-desktop` from Docker Hub.

---

## Step 2: Open the Project in VSCode

1. Open VSCode.
2. Open the devcontainer.json file located in the `.devcontainer` folder.
3. Press `F1` (or `Ctrl+Shift+P` / `Cmd+Shift+P`) to open the command palette.
4. Type and select **"Dev-Containers: Reopen in Container"**.
5. Select the current folder.

VSCode will now:

* Pull the `osrf/ros:humble-desktop` Docker image from Docker Hub if not present.
* Start the container with all the configured settings.
* Mount your project folder to `/workspace` inside the container.
* Open a new VSCode window connected to the container environment.

---

## Step 3: Use the ROS2 Development Environment Inside the Container

Once inside the container:

* Your workspace folder is mounted at `/workspace`.
* You can create your ROS2 workspace inside `/workspace`, for example:

```bash
cd /workspace
mkdir -p ros2_ws/src
cd ros2_ws
colcon build
```

* Alternatively, you can create new folders anywhere inside `/workspace` and use them as workspaces.

---

## Step 4: Developing with ROS2 in VSCode

* You have C++ and ROS extensions installed in the container by default.
* Build your ROS2 packages using `colcon` or other ROS2 tools inside the integrated terminal.
* The container includes necessary tools (`build-essential`, ROS2 packages, etc.).
* You can run and debug ROS2 nodes inside the container.

---

## Additional Notes

* **DISPLAY forwarding** is configured so GUI applications inside the container can access your host's X server (Linux/macOS).
* The container runs as root user by default for simplicity.
* Your source code and changes live on your host machine; the container provides the environment and tools.

---

## Summary

| Action                      | How to do it                                                   |
| --------------------------- | -------------------------------------------------------------- |
| Pull the Docker image       | Run `scripts/dev_docker_pull.sh` (optional)                    |
| Open project in container   | VSCode > F1 > "Dev-Containers: Reopen in Container"            |
| Create ROS2 workspace       | Inside container, create `/workspace/ros2_ws` or other folder  |
| Build and run ROS2 packages | Use terminal inside container, run `colcon build`, etc.        |

---

If you face any issues or want to modify the container, please refer to the `.devcontainer/devcontainer.json` or contact your maintainer.

---
Author: Hrithik Dhongadi