#!/bin/bash
# Install Robotic Operating System (ROS) on NVIDIA Jetson TX2
# Requirement: 
# Ubuntu 16.04 LTS

# Setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Set up your keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# Installation
sudo apt-get update

# For full desktop install uncomment the following line
# 	sudo apt-get install ros-kinetic-desktop-full

# ROS-Base bare bone installation
sudo apt-get install ros-kinetic-ros-base

# Individual Package: You can also install a specific ROS package (replace underscores with dashes # of the package name):
#	sudo apt-get install ros-kinetic-PACKAGE
# 	e.g.
# 	sudo apt-get install ros-kinetic-slam-gmapping


# To find available packages, use:

# 	apt-cache search ros-kinetic

# to avoid rosdep init ERROR
sudo c_rehash /etc/ssl/certs

# Initialize rosdep
sudo apt-get install python-rosdep -y
sudo rosdep init
rosdep update

# Environment setup
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Dependencies for building packages 
sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential

