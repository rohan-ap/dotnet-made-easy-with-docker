# .NET Core made easy with docker

Sample dockerise a .NET Core application

how to build the image 
```
docker build -t dotnet-made-easy-with-docker:V0.01 .
```
how to run the containner
```
docker run -it --rm -p 8080:80 dotnet-made-easy-with-docker:V0.01
```
