FROM python:latest as img1
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python","app.py"]

FROM python:latest as img2
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 6000
CMD ["python","app.py"]
