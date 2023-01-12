FROM ubuntu

WORKDIR /

COPY . .

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y python3-pip
RUN pip install --upgrade pip
RUN pip install wheel gunicorn
RUN pip install -r req.txt

ENV SECRET_KEY=ae@es-!ez2hay&gwf!n5q@296(4b8+ni12+f-wrs819ue+4ad_
ENV DB_NAME=railway
ENV DB_USER=postgres
ENV DB_PASSWORD=FTZw4N9Q7Sm3SPElfY8L
ENV DB_HOST=containers-us-west-96.railway.app
ENV DB_PORT=7833
ENV DEBUG=1
ENV ALLOWED_HOSTS=0.0.0.0,127.0.0.1,django-shop-production.up.railway.app
ENV PORT=8000

RUN python3 manage.py collectstatic

CMD gunicorn --bind 0.0.0.0:$PORT config.wsgi:application