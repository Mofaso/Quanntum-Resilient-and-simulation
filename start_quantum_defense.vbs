Set objShell = CreateObject("WScript.Shell")

' Paths - adjust if you move the project
backendPath  = "E:\AI-Driven Quantum-Resilient Cryptographic Agility Framework for Secure Cyber Defense\backend"
frontendPath = "E:\AI-Driven Quantum-Resilient Cryptographic Agility Framework for Secure Cyber Defense\frontend"

' 0 = hidden window, False = do not wait

' Start FastAPI backend (port 18000) in background
objShell.Run "cmd /c cd /d """ & backendPath & """ && .\venv\Scripts\python -m uvicorn main:app --port 18000", 0, False

' Small delay to let backend start
WScript.Sleep 3000

' Start React/Vite dev server in background
objShell.Run "cmd /c cd /d """ & frontendPath & """ && npm run dev", 0, False

' Wait a bit for Vite to boot, then open Electron Desktop window
WScript.Sleep 5000
electronPath = "E:\AI-Driven Quantum-Resilient Cryptographic Agility Framework for Secure Cyber Defense\electron_app"
objShell.Run "cmd /c cd /d """ & electronPath & """ && npm start", 0, False
