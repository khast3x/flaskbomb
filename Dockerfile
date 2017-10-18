FROM python:3-alpine

RUN apk --update --no-cache add gzip
ADD . /app
WORKDIR /app


RUN pip install -r requirements.txt

EXPOSE 5000

RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
CMD ["normal", "1"]