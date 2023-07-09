#!/bin/bash

mkdir tempdir04
mkdir tempdir04/templates
mkdir tempdir04/static

cp sample_app.py tempdir04/.
cp -r templates/* tempdir04/templates/.
cp -r static/* tempdir04/static/.

echo "FROM python" >> tempdir04/Dockerfile
echo "RUN pip install flask" >> tempdir04/Dockerfile
echo "COPY  ./static /home/myapp/static/" >> tempdir04/Dockerfile
echo "COPY  ./templates /home/myapp/templates/" >> tempdir04/Dockerfile
echo "COPY  sample_app.py /home/myapp/" >> tempdir04/Dockerfile
echo "EXPOSE 5050" >> tempdir04/Dockerfile
echo "CMD python /home/myapp/sample_app.py" >> tempdir04/Dockerfile

cd tempdir04
docker run -t -d -p 5050:5050 --name samplerunning02 sampleapp01
docker ps -a 
