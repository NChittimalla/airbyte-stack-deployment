from dagster import job, op, repository

@op
def hello_world(context):
    context.log.info("Hello, Dagster!")
    return 'Hello, Dagster!'

@job
def hello_job():
    hello_world()

@repository
def hello_repository():
    return [hello_job]
