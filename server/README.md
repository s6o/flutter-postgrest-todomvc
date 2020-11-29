# Server

## SW Requirements

* [Postgres](https://www.postgresql.org/) >= 10.x
* [dbmate](https://github.com/amacneil/dbmate/releases) >= 1.9.1
* [PostgREST](https://github.com/PostgREST/postgrest/releases) >= 7.0.1

In additon to the *Postgres* installation, the *dbmate* CLI is expected to be
found in *PATH* and the *postgrest* binary is expected to be installed into
the __server/__ subdirectory.

## Generate JWT secret

```bash
cd server
openssl rand -base64 32 >> .jwtsecret
```

## Database setup

```bash
cd server
psql -d postgres -c "CREATE DATABASE flutter_todomvc"
./dbmate.sh migrate
```

or with overridding the default Postgres user 'postgres'

```bash
cd server
psql -U ols -d postgres -c "CREATE DATABASE flutter_todomvc"
PGUSER=ols ./dbmate.sh migrate
```

### Database developemnt seed

```bash
cd server
psql -d flutter_todomvc -f ./seed-development.sql
```

or with overridding the default Postgres user 'postgres'

```bash
cd server
psql -U ols -d flutter_todomvc -f ./seed-development.sql
```

## Starting server

### MacOS

```bash
cd server
wget https://github.com/PostgREST/postgrest/releases/download/v7.0.1/postgrest-v7.0.1-osx.tar.xz
tar -xJf postgrest-v7.0.1-osx.tar.xz
```

### Linux

```bash
cd server
wget https://github.com/PostgREST/postgrest/releases/download/v7.0.1/postgrest-v7.0.1-linux-x64-static.tar.xz
tar -xJf postgrest-v7.0.1-linux-x64-static.tar.xz
```

```bash
cd server
./pgrest.sh
```

or with overridding the default Postgres user 'postgres'

```bash
cd server
PGUSER=ols ./pgrest.sh
```
