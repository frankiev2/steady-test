FROM andrewfl99/steady:latest

COPY . /app
WORKDIR /app

RUN pip install -r version.txt


ENTRYPOINT ["python"]
CMD ["app.py"]
