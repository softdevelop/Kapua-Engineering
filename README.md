# Kapua-Engineering

## Getting Started
Git hub repo: [Kapua-Engineering](https://github.com/softdevelop/Kapua-Engineering)

### Installing

A step by step series of examples that tell you have to get a development env running.

1. Django backend.

```
virtualenv -p python3 env
```
```
pip install -r requirements.txt
```

Setting database in settings_local.py


```
python manage.py makemigrations
python manage.py makemigrations Manager
```

```
python manage.py migrate
```

import database postgres:
```
djangoTenant.sql
```

```
	python manage.py runserver
```

2. React frontend.

Before install you should prepare:
* Nodejs
* npm

Installing:

Open folder 'sortable-tree' with terminal and install packgages:

```
npm install
```

```
npm install axios
```

## Running

1. Run server django:
* run:
```
	python manage.py runserver
```
* collect static:
```
	python manage.py collectstatic
```

2. Run react:
* run:
```
	npm start 
```
* build:
```
	npm run build
```

## Demo URLS

1. Django backend:
```
APIURL GET: http://localhost:8000/list-node/
```
```
APIURL POST: http://localhost:8000/list-node-update/
```

2. React frontend:

```
APIURL: http://localhost:3000/
```

3. Build:
```
	http://localhost:8000/
```
### And coding style tests

Explain what these tests test and why

```
Pep8 for python
```

## Deployment build
In react directory:

```
	npm run build
```
In sortable-tree/build/index.html look at 2 position have main.xxxx.css and main.xxxx.js

replace css and js "djangoTenant/templates/index.html" file
```
<link href="{% static 'css/main.be2e3e6e.css' %}" rel="stylesheet">
```

```
<script type="text/javascript" src="{% static 'js/main.93d1f3d6.js' %}"></script>
```

```
	python manage.py collectstatic
```
```
	python manage.py runserver
```
see the result only on port :8000
```
	http://localhost:8000/
```
## Built With

* [Django](https://www.djangoproject.com/) - The web framework used
* [Django Rest Framework](http://www.django-rest-framework.org/) - Used to write API
* [NodeJs](https://nodejs.org/en/download/) - Use for install node
* [NPM](https://docs.npmjs.com/cli/install) - Use for install npm

## Contributing


## Versioning

V.1 Inital version

## Authors

* **Linh Duong** - *Developer* - [softdevelop](https://github.com/softdevelop)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

Who you will ask for this project?
* **Linh Duong** - *Developer* - [softdevelop](https://github.com/softdevelop)
 
