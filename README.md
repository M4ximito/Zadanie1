a. Aby utworzyć obraz kontenera na podstawie Dockerfile, użyj polecenia `docker build`. Przejdź do katalogu, w którym znajduje się plik Dockerfile, i wykonaj następujące polecenie:

```shell
docker build -t zadanie1 .
```

b. Aby uruchomić kontener na podstawie utworzonego obrazu, użyj polecenia `docker run`.

```shell
docker run -p <3000>:<30000> zadanie1
```


c. Aby uzyskać informacje generowane przez serwer podczas uruchamiania kontenera `http://localhost:3000` w przeglądarce.

d. Aby sprawdzić liczbę warstw w zbudowanym obrazie Docker, użyj polecenia `docker history`.

```shell
docker history zadanie1
