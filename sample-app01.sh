#!/bin/bash

mkdir tempdir03
mkdir tempdir03/templates
mkdir tempdir03/static

cp sample_app.py tempdir03/.
cp -r templates/* tempdir03/templates/.
cp -r static/* tempdir03/static/.

echo "FROM python" >> tempdir03/Dockerfile
echo "RUN pip install flask" >> tempdir03/Dockerfile
echo "COPY  ./static /home/myapp/static/" >> tempdir03/Dockerfile
echo "COPY  ./templates /home/myapp/templates/" >> tempdir03/Dockerfile
echo "COPY  sample_app.py /home/myapp/" >> tempdir03/Dockerfile
echo "EXPOSE 5050" >> tempdir03/Dockerfile
echo "CMD python /home/myapp/sample_app.py" >> tempdir03/Dockerfile

cd tempdir03
docker build -t sampleapp02 .
docker run -t -d -p 5050:5050 --name samplerunning02 sampleapp02
docker ps -a 
