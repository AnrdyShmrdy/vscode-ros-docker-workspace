#Either change the below tag or set it in the run args to change the image pulled
ARG tag=humble
FROM ros:${tag}
#note: env variable ROS_DISTRO should already be set in the image. If not, uncomment below line and set to your chosen ros distro:
#ENV ROS_DISTRO=humble
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
VOLUME /dev_ws
WORKDIR /dev_ws