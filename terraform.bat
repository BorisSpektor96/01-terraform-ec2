@echo off
dotenv -e .env -- terraform %*


@REM dotenv -e .env -- terraform init
@REM dotenv -e .env -- terraform apply
