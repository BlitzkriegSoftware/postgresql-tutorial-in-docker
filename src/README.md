# Generate Sales Data

This presumes, you have already fully setup the `salesdb` by running the `.\data\salesdb\` scripts, see root [README.md](..\README.md)

## How to run

```powershell
# With default parameters
.\src\generate_data.ps1
```

```powershell
# With additional parameters
.\src\generate_data.ps1 -Year 2022 -Number 50
```

## Introduction

Generates sales data in postgres db

## Prerequisites

- NPM v11+
- Node v24+
- Powershell 7+

## Command line Arguments

- `-c`

  - Valid PostgreSql connection string
  - default (localhost as created by scripts is) `postgresql://postgres:password123-@localhost/salesdb`

* `-n`

  - Number of rows to make
  - default: `500`

* `-y`
  - Year to make rows for
  - default: `2024`

## Refs

- https://node-postgres.com/
