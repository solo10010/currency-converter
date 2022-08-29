# makefile puthon3 django project

all:
	( \
       source venv/bin/activate; \
       pip freeze > requirements.txt; \
	   pip install -r requirements.txt; \
	   python3 converter/manage.py runserver; \
    )
install:
	( \
       source venv/bin/activate; \
       pip freeze > requirements.txt; \
	   pip install -r requirements.txt; \
    )
run:
	python3 converter/manage.py runserver;