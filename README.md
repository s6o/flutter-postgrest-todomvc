# Flutter PostgREST TodoMVC

A TodoMVC with Flutter for Android, iOS and Web, and with PostgREST to control
the backend PostgreSQL database.

An example of a small [Flutter](https://flutter.dev/) application using
[Postgres](https://www.postgresql.org/) via [PostgREST](https://github.com/PostgREST/postgrest)
for its back-end API services, instead of [Firebase](https://firebase.google.com/).

At present the user account creation requires manually adding new user records
to the respective Postgres database table. A more realistic real world user registration
process could utilize [Zapier and SendGrid](https://zapier.com/apps/postgresql/integrations/sendgrid)
for user activation and notification via email.

Alternatively, a custom event driven back-end with e.g. Node + [pg-listen](https://github.com/andywer/pg-listen)
or [Elixir/Phoenix](https://www.phoenixframework.org/)
could be added to control user registration, email notifications etc., where
the event pipeline would utilize Postgres' [NOTIFY](https://www.postgresql.org/docs/13/sql-notify.html)
and [LISTEN](https://www.postgresql.org/docs/13/sql-listen.html).

