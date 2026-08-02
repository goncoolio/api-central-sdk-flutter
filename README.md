# API Central SDK for Flutter

SDK Dart/Flutter pour l'API Central S2S.

## Packages

| Package | Description |
|---|---|
| `api_central_sdk` | Core Dart pur : auth, users, messaging, notifications, support, live, realtime |
| `api_central_calls` | Appels audio/vidéo WebRTC (phase 5) |
| `api_central_encryption` | Chiffrement E2E (phase 6) |
| `api_central_provider` | ChangeNotifier prêts à brancher (phase 7) |

## Authentification

Les credentials de l'API Central S2S (`api_key`, `api_secret`) restent sur le backend
de chaque application et ne sont **jamais** embarqués dans une app mobile. Le SDK obtient
un token utilisateur via un `TokenProvider` fourni par l'application.

Voir `docs/superpowers/specs/2026-08-02-sdk-flutter-design.md` dans le dépôt
`api-central-s2s-rust`.

## Développement

```bash
cd packages/api_central_sdk
dart pub get
dart test
dart analyze
```
