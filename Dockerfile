FROM andrewfl99/steady

COPY . /app
WORKDIR /app

RUN pip install -r version.txt

EXPOSE 5001

ENTRYPOINT ["python"]
CMD ["app.py"]
