FROM mongo:3.2

MAINTAINER Commande-Online.fr SAS

COPY ./init /init-DB
COPY ./conf /conf-DB

ENTRYPOINT ["/conf-DB/entrypoint.sh"]

EXPOSE 27017
CMD ["mongod"]