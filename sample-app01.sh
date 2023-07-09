#!/bin/bash

mkdir tempdir01
mkdir tempdir01/templates
mkdir tempdir01/static

cp sample_app.py tempdir01/.
cp -r templates/* tempdir01/templates/.
cp -r static/* tempdir01/static/.

echo "FROM python" >> tempdir01/Dockerfile01
echo "RUN pip install flask" >> tempdir01/Dockerfile01
echo "COPY  ./static /home/myapp/static/" >> tempdir01/Dockerfile01
echo "COPY  ./templates /home/myapp/templates/" >> tempdir01/Dockerfile01
echo "COPY  sample_app.py /home/myapp/" >> tempdir01/Dockerfile01
echo "EXPOSE 5050" >> tempdir01/Dockerfile01
echo "CMD python /home/myapp/sample_app.py" >> tempdir01/Dockerfile01

cd tempdir01
docker build -t sampleapp01 .
docker run -t -d -p 5050:5050 --name samplerunning01 sampleapp01
docker ps -a 
