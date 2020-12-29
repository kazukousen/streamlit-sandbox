build:
	docker -f ./Dockerfile build -t streamlit-app:local .

run: build
	docker run -p 8501:8501 streamlit-app:local
