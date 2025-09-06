# Postgres Dev Env with a sample Sales data db

## docker base image

- https://hub.docker.com/_/postgres

## Prerequisites

- Powershell 7+
- Docker Desktop (running)
- (optional) PgAdmin or equivalent is recommended

## starting Postgres in docker

```powershell
.\start-pg.ps1
```

## initializing the SalesDB data

This will create all of the tables, views, etc. but with no actual sales data (yet)

```powershell
# Be sure to wait a minute or so for Postgres to start before running!
.\data\salesdb\sales_db_base.ps1
```

## Generating some actual Sales Orders (and details)

```text
generate_data.ps1 [[-Year] <string>] [[-Number] <int>]
```

- `-Year` Year to generate data for
  - Default: `2024`
- `-Number` Number of Sales Orders to generate
  - Default: `100`

```powershell
# With default parameters
.\src\generate_data.ps1
```

```powershell
# With additional parameters
.\src\generate_data.ps1 -Year 2022 -Number 50
```

For more see: [Instructions](src\README.md)

## stopping Postgres in docker

```powershell
.\stop-pg.ps1
```
