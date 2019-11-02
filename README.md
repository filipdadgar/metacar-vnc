# metacar-vnc
gym-metacar in a complete gui environment

Inspired by https://www.metacar-project.com/ 
and move over to Python for wins: https://github.com/AI-Guru/gym-metacar

This image is based on Ubuntu with VNC and all nessaccary packages for running gym environment.

To run:

1. Clone the repo
2. cd to directory
3. docker build -t [name of image] .
4. docker run -p 5900:5900 --name [name it something] [name of image]
