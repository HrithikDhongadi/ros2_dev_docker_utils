#!/bin/bash

# Get the current directory
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo $script_dir
cd "$script_dir"

# Pull the ROS2 Humble Docker image from Docker Hub
echo "Pulling ROS2 Humble image from Docker Hub..."
docker pull osrf/ros:humble-desktop

echo "Done. The image 'osrf/ros:humble-desktop' is now available locally."