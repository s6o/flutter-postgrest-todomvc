# TodoMVC

A TodoMVC with Flutter and PostgREST as backend server with Postgres.

## Requirements

* Flutter >= 3.10.x

## JSON decoder/encoder generation

Configuration is [build.yaml](./build.yaml)

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Run Web

The app defaults to Flutter Web.

```bash
flutter run -d chrome
```

The test logins can be found in the [development seed file](./../server/seed-development.sql)

## Testing Android, iOS with ngrok

For Andorid, iOS testing the _isApp flag needs to flipped in lib/api.dart.

To test the mobile app, postgrest has to be configured to run on a local network
instead of the default localhost:3000.

Alternatively, [ngrok](https://ngrok.com/download) can be used to proxy traffic
from mobile app to postgrest running locally on localhost:3000.

After having started postgrest via __server/pgrest.sh__ start ngrok:

```bash
ngrok http 3000
```

Paste ngrok address into lib/api.dart's variable _baseUrlApp.
