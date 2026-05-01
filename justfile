set dotenv-load

profiles := "."
venv := ".venv/bin"

install:
    {{venv}}/pip install -r requirements.txt

debug:
    {{venv}}/dbt debug --profiles-dir {{profiles}}

run:
    {{venv}}/dbt run --profiles-dir {{profiles}}

run-model model:
    {{venv}}/dbt run --select {{model}} --profiles-dir {{profiles}}

run-upstream model:
    {{venv}}/dbt run --select +{{model}} --profiles-dir {{profiles}}

test:
    {{venv}}/dbt test --profiles-dir {{profiles}}

compile:
    {{venv}}/dbt compile --profiles-dir {{profiles}}

clean:
    {{venv}}/dbt clean --profiles-dir {{profiles}}
