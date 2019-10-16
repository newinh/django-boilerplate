FROM python:3.7

WORKDIR /django-boilerplate

COPY django_project ./django_project
COPY ["manage.py", "uwsgi.ini", "Pipfile*", ".env*", "./"]

RUN pip install pipenv \
    && pipenv install --system --deploy --ignore-pipfile --skip-lock

RUN python3 manage.py collectstatic

CMD ["uwsgi", "--ini", "uwsgi.ini"]
