[![CircleCI](https://circleci.com/gh/iidrees/project-ml-microservice-kubernetes.svg?style=svg)](https://circleci.com/gh/iidrees/project-ml-microservice-kubernetes)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create a virtualenv and activate it
  - To create a virtual environment run the command `python -m venv .devops` in 
  order to create the virtualenv in the current working directory
  -  After creating the environment, you can activate it with this command `source .devops/bin/activate`

* Run `make install` to install the necessary dependencies
  - After activating the virtual environment you should go ahead to install the python packages in the `requirements.txt` file with `make install`. 
  **NB** Please add the package `pylint` in the requirements.txt file before installig the packages.

### Running `app.py`

1. Standalone:  `python app.py`
  - By running this standalone command you would be able able to start the app and run predictions in another terminal by running the script `./make_prediction.sh` in another terminal window.
2. Run in Docker:  `./run_docker.sh`
  - In order to prepare the app to be dockerized, ensure that you run this command `docker login` and in order to authenticate with your docker hub account before running the script `./run_docker.sh` to build the docker image for this project.
3. Run in Kubernetes:  `./run_kubernetes.sh`
  - In order to deploy the docker image in kubernetes, you would first need to ensure that you have your cluster up and running by running the command `kubectl config view` where you should see at least one cluster with a `certificate-authority` and `server` after which you should run the script `./run_kubernetes`

### Kubernetes Steps

* Setup and Configure Docker locally
  - In order to configure Docker locally, run the command `docker build -t <dockerhub ID>/<image-tag-name> . ` to build the app locally
  - After building the  app locally you can run the command `docker run -p <host port>:<container port> <dockerhub ID>/<image-tag-name> ` in order to test that your docker image works.
  - In another terminal you can run the script `./make_prediction.sh` to confirm that you can make predictions
  - After you are sure that the image does what it is meant to do you can run the script `./upload_docker.sh` to push the image to your dockerhub account
* Setup and Configure Kubernetes locally
  - To setup your kubernetes cluster locally, ensure that you have `minikube` installed on your machine and then run the command `minikube start`
  - After the cluster has been started you are ready to deploy your docker image in that cluster.
* Create Flask app in Container
  - To deploy your Flask app, run the script `./run_kubernetes.sh`
  - This script would deploy your app into the container as well as list the pods and lastly port forward the port of the container to the host.
  The first time you run the script would show that the container is still being created and the port forwarding failed because the container is still pending, wait for a couple of minutes before running the script again and you would see the port correctly port forwarded.
* Run via kubectl
  - In order to test the pod, you can run the command `kubectl get pods` and `kubectl logs <container name>` in order to see the running pods and also see the log of the running pod
  - While the pod is running you can run the script `.make_prediction.sh` in order to be sure that your app running in the cluster was still accessible.
