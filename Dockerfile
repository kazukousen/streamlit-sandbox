FROM python:3.8 as builder
RUN pip install poetry
WORKDIR /tmp
COPY pyproject.toml poetry.lock ./
RUN poetry export -f requirements.txt --without-hashes > requirements.txt

FROM python:3.8
WORKDIR /usr/src/app
COPY --from=builder /tmp/requirements.txt .
RUN pip install -r requirements.txt
COPY streamlit_sandbox ./streamlit_sandbox
CMD [ "streamlit", "run", "./streamlit_sandbox/main.py" ]
