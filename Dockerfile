FROM python:2.7-alpine
#FROM andrewfl99/steady

COPY . /app
WORKDIR /app

RUN pip install -r version.txt


ENTRYPOINT ["python"]
CMD ["app.py"]
