#!/bin/bash

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp sample_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "FROM python" >> tempdir/Dockerfile01
echo "RUN pip install flask" >> tempdir/Dockerfile01
echo "COPY  ./static /home/myapp/static/" >> tempdir/Dockerfile01
echo "COPY  ./templates /home/myapp/templates/" >> tempdir/Dockerfile01
echo "COPY  sample_app.py /home/myapp/" >> tempdir/Dockerfile01
echo "EXPOSE 5050" >> tempdir/Dockerfile01
echo "CMD python /home/myapp/sample_app.py" >> tempdir/Dockerfile01

cd tempdir
docker build -t sampleapp01 .
docker run -t -d -p 5050:5050 --name samplerunning01 sampleapp01
docker ps -a 
