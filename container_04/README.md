# Django on Docker

* Host OS
```
$ sw_vers && docker -v && docker-compose -v && python3 -V
ProductName:	Mac OS X
ProductVersion:	10.12.4
BuildVersion:	16E195
Docker version 17.03.1-ce, build c6d412e
docker-compose version 1.11.2, build dfed245
Python 3.6.1
```

* Deployment instructions
```
docker-compose run web django-admin.py startproject composeexample .
docker-compose up
```