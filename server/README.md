# Server

## SW Requirements

* [Postgres](https://www.postgresql.org/) >= 12.x
* [dbmate](https://github.com/amacneil/dbmate/releases) >= 1.15.x
* [PostgREST](https://github.com/PostgREST/postgrest/releases) >= 11.x

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
psql -U postgres "CREATE DATABASE flutter_todomvc"
PGUSER=postgres ./dbmate.sh migrate
```

### Database developemnt seed

```bash
cd server
psql -U postgres -d flutter_todomvc -f ./seed-development.sql
```

## PostgREST setup

### Download PostgREST

#### MacOS (intel, M1)

```bash
brew install postgrest
ln -s `which postgrest`
```

#### Linux

```bash
cd server
wget https://github.com/PostgREST/postgrest/releases/download/v11.2.2/postgrest-v11.2.2-linux-static-x64.tar.xz
tar -xJf postgrest-v11.2.2-linux-static-x64.tar.xz
```

### Starting the server

```bash
cd server
PGUSER=postgres ./pgrest.sh
```
