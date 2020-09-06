# WIP: Flutter PostgREST TodoMVC

An example of a small [Flutter](https://flutter.dev/) application using
[Postgres](https://www.postgresql.org/) via [PostgREST](https://github.com/PostgREST/postgrest)
for its back-end API services, instead of [Firebase](https://firebase.google.com/).

At present the user account creation requires manually adding new user records
to the respective Postgres database table. A more realistic real world user registration
process could utilize [Zapier and SendGrid](https://zapier.com/apps/postgresql/integrations/sendgrid)
for user activation and notification via email.

## Server

* [Postgres](https://www.postgresql.org/) >= 10.x
* [dbmate](https://github.com/amacneil/dbmate/releases) >= 1.9.1
* [PostgREST](https://github.com/PostgREST/postgrest/releases) >= 7.0.1

In additon to the *Postgres* installation, the *dbmate* CLI is expected to be
found in *PATH* and the *postgrest* binary is expected to be installed into
the __server/__ subdirectory.

### Generate JWT secret

```bash
cd server
openssl rand -base64 32 >> .jwtsecret
```

### Database setup

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

#### Database developemnt seed (optional)

```bash
cd server
psql -d flutter_todomvc -f ./seed-development.sql
```

or with overridding the default Postgres user 'postgres'

```bash
cd server
psql -U ols -d flutter_todomvc -f ./seed-development.sql
```

### Starting server

```bash
cd server
./pgrest.sh
```

or with overridding the default Postgres user 'postgres'

```bash
cd server
PGUSER=ols ./pgrest.sh
```
