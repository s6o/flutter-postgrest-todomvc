# Flutter PostgREST TodoMVC

An example of a small [Flutter](https://flutter.dev/) application using
[Postgres](https://www.postgresql.org/) via [PostgREST](https://github.com/PostgREST/postgrest)
for its back-end API services, instead of [Firebase](https://firebase.google.com/).

At present the user account creation requires manually adding new user records
to the respective Postgres database table. A more realistic real world user registration
process could utilize [Zapier and SendGrid](https://zapier.com/apps/postgresql/integrations/sendgrid)
for user activation and notification via email.

The [app/](./app/README.md) and [server/](./server/README.md) directories each
have their respective README-s with more details for setup.

