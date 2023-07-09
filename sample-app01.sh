#!/bin/bash

mkdir tempdir02
mkdir tempdir02/templates
mkdir tempdir02/static

cp sample_app.py tempdir02/.
cp -r templates/* tempdir02/templates/.
cp -r static/* tempdir02/static/.

echo "FROM python" >> tempdir02/Dockerfile
echo "RUN pip install flask" >> tempdir02/Dockerfile
echo "COPY  ./static /home/myapp/static/" >> tempdir02/Dockerfile
echo "COPY  ./templates /home/myapp/templates/" >> tempdir02/Dockerfile
echo "COPY  sample_app.py /home/myapp/" >> tempdir02/Dockerfile
echo "EXPOSE 5050" >> tempdir02/Dockerfile01
echo "CMD python /home/myapp/sample_app.py" >> tempdir02/Dockerfile02

cd tempdir02
docker build -t sampleapp02 .
docker run -t -d -p 5050:5050 --name samplerunning02 sampleapp02
docker ps -a 
