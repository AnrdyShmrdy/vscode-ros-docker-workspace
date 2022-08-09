FROM ros:humble
ARG ROS_DOMAIN_ID=1
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN echo "export ROS_DOMAIN_ID=${ROS_DOMAIN_ID}" >> ~/.bashrc