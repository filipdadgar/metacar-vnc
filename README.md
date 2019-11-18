# metacar-vnc
gym-metacar in a complete gui environment

Inspired by https://www.metacar-project.com/ 
and move over to Python for wins: https://github.com/AI-Guru/gym-metacar

This image is based on Ubuntu with VNC and all nessaccary packages for running gym environment.

To run:

docker run -p 6000:5900 -d --name [name it something] filipdadgar/ls-gym

With password:

docker run -p 6000:5900  -d --name [name it something] --env VNC_SERVER_PASSWORD=password filipdadgar/ls-gym

Or build your own image:

1. Clone the repo
2. cd to directory
3. docker build -t [name of image] .


* Start [tightvnc](https://www.tightvnc.com) and connect to localhost:6000
* Right click anywhere on the screen and then Applications -> Shell -> Bash
* cd examples
* Run any of the files with python3 filename
