FROM imton/node-python:latest

WORKDIR /app
COPY . .

RUN apt-get update && apt-get install lsof

RUN npm install

EXPOSE 3030

COPY requirements.txt .




RUN pip3 install --upgrade pip

RUN pip3 install --no-cache-dir -r requirements.txt




COPY ./bin/test.sh ./bin/test.sh

CMD [ "bash", "bin/test.sh" ]
