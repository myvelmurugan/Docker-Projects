FROM python:3

RUN pip install flask
RUN pip install MySQL
RUN pip install request
RUN pip install flask_mysqldb
EXPOSE 8080
VOLUME /flask
COPY /flask/ /flask
EXPOSE 8080
WORKDIR /flask
CMD [ "python", "./app_script.py" ]
