<<<<<<< HEAD
FROM python:2.7-alpine
#FROM andrewfl99/steady
=======
FROM andrewfl99/steady
>>>>>>> 8c9facb2471925e47ad6d935b80cde15170c2a19

COPY . /app
WORKDIR /app

RUN pip install -r version.txt


ENTRYPOINT ["python"]
CMD ["app.py"]
