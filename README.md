# AI-Driven Quantum-Resilient Cryptographic Agility Defense System

Production-quality reference implementation of a **Windows desktop (Electron) security application** backed by a **FastAPI security engine**. It provides:

- AI-driven **anomaly + attack classification** (Isolation Forest + Autoencoder-style MLP + RandomForest)
- **Quantum attack simulation** for RSA/ECC (Shor-style resource estimation)
- **Cryptographic agility + self-healing** (auto-migrate vulnerable algorithms to PQC when risk is high)
- **Post-Quantum Cryptography (PQC)** abstractions (Kyber/Dilithium/SPHINCS+) via `pqcrypto` when available
- **Secure authentication**: Argon2 hashing, MFA (TOTP), RBAC, device-bound JWT, refresh rotation, lockout, rate-limited auth
- **Secure Key Vault**: AES-GCM encrypted-at-rest key material + key lifecycle endpoints
- **Tamper-evident audit logging**: hash-chained audit entries + chain verification

## Project structure

```
project_root/
  backend/
    main.py
    config.py
    requirements.txt
    ai_engine/
    auth/
    audit/
    crypto_engine/
    database/
    simulation/
    security/
  frontend/
    src/
  electron_app/
    main.js
    preload.js
  docker-compose.yml
  .env.example
```

## Prerequisites (Windows)

- **Python 3.11+** (recommended 3.12/3.13)
- **Node.js 20+**
- Optional (recommended): **Docker Desktop** for PostgreSQL

## Quick start (dev, zero-config)

This uses **SQLite** by default so you can start immediately.

### Backend

```powershell
cd "e:\AI-Driven Quantum-Resilient Cryptographic Agility Framework for Secure Cyber Defense\backend"
.\venv\Scripts\python -m pip install -r requirements.txt
.\venv\Scripts\python -c "from database.init_db import init_db; init_db()"
.\venv\Scripts\python -m uvicorn main:app --port 18000
```

### Frontend

```powershell
cd "e:\AI-Driven Quantum-Resilient Cryptographic Agility Framework for Secure Cyber Defense\frontend"
npm install
npm run dev
```

### Electron (desktop shell)

```powershell
cd "e:\AI-Driven Quantum-Resilient Cryptographic Agility Framework for Secure Cyber Defense\electron_app"
npm install
npm run dev
```

## Production-like setup (PostgreSQL)

### Start Postgres

```powershell
cd "e:\AI-Driven Quantum-Resilient Cryptographic Agility Framework for Secure Cyber Defense"
docker compose up -d
```

### Point backend to Postgres

Set `DATABASE_URL` (example):

```
DATABASE_URL=postgresql+psycopg://postgres:postgres@localhost:5432/quantum_defense
```

Then initialize tables:

```powershell
cd "e:\AI-Driven Quantum-Resilient Cryptographic Agility Framework for Secure Cyber Defense\backend"
.\venv\Scripts\python -c "from database.init_db import init_db; init_db()"
```

## Security notes

- **Device-bound auth**: the frontend sends an `X-Device-Fingerprint` header. Tokens are bound to that value.
- **Audit logs are tamper-evident**: use `GET /api/audit/verify` (admin only).
- **PQC**: when `pqcrypto` is installed, Kyber/Dilithium/SPHINCS+ operations use it; otherwise a safe-to-run simulation fallback is used.
- **TLS**: for production, run the API behind TLS (reverse proxy) or configure Uvicorn with certificates and pin the cert in Electron.

## Building the Windows desktop app

This packages the Electron shell + built React UI. The Python backend is **not bundled** in this reference build; for deployment, ship the backend as a Windows service or bundle Python as an extra resource and spawn it.

```powershell
cd "e:\AI-Driven Quantum-Resilient Cryptographic Agility Framework for Secure Cyber Defense\electron_app"
npm install
npm run build
```

## Default API endpoints

- `POST /api/auth/register`
- `POST /api/auth/login`
- `POST /api/auth/refresh`
- `GET  /api/auth/me`
- `GET  /api/dashboard/metrics`
- `POST /api/ai/analyze-traffic`
- `POST /api/simulation/quantum-attack`
- `POST /api/crypto/migrate` (admin)
- `GET  /api/crypto/policy`
- `PUT  /api/crypto/policy` (admin)
- `GET  /api/keys/active`
- `POST /api/keys/rotate` (admin)
- `GET  /api/logs` (admin)
- `GET  /api/audit/verify` (admin)

