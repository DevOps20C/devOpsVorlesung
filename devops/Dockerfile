FROM python:3.9

WORKDIR /devops

COPY ./requirements.txt /devops/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /devops/requirements.txt

COPY ./ /devops/

ENV FLASK_APP=app/__init__.py

CMD ["gunicorn", "--conf", "gunicorn_conf.py", "--bind", "0.0.0.0:80", "app:app"]
