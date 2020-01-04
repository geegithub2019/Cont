[![CircleCI](https://circleci.com/gh/geegithub2019/Cont.svg?style=svg)](https://circleci.com/gh/geegithub2019/Cont)

## Project Overview
The project is on operationalizing a Machine Learning Microservice based app. The following steps were undertaken to put the app in production:

1) Create a environment with Python3.
2) Cloning the files required for the app and its dependencies.
3) Dockerizing the app and testing the app.
4) Uploading the app to the docker registry.
5) Deploying the app in a kubernetes cluster with minikube.
6) Testing the deployment code with circlci.


### Instructions

1) Created a new environment with the following commands:

python3 -m venv ~/.devops
source ~/.devops/bin/activate

2) Used pip to upgrade pip and install requirements for the app.

pip install --upgrade pip &&\
		pip install -r requirements.txt
    
3) Created a docker file with that will define the app container runtime ,deploy app and expose port so that users can access the application with the following commands:

FROM python:3.7.3-stretch
WORKDIR /app
COPY . /app.py /app/
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt
EXPOSE 80
RUN chmod 644 app.py
CMD ["python", "app.py"]

4) Used hadolint to validate the app python code with the following command in the Makefile:
hadolint Dockerfile

5) Deployed the docker app container with the script 'run_docker.sh' and it will run on port 80 and the host port is on port 8000.

6) Tested the flask framework based app using api calls with the the shell script 'make_prediction.sh' and the response should be a '200' ok which should be seen from the app logs. 

7) Uploaded the container image with app to the docker registry using the script 'upload_docker.sh'

8) Deployed the app onto the kubernetes cluster with minikube using the script 'run_kubernetes.sh'.

9) Tested the app running on the kubernetes cluster with the shell script 'make_prediction.sh'. This time the connection will be refused as the apps in a kubernetes cluster can be accessed only via proxy.

10) Validated the code with circleci and ensuring code passed the lint tests



