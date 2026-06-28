$WshShell = New-Object -ComObject WScript.Shell
$DesktopPath = [System.Environment]::GetFolderPath('Desktop')
$Shortcut = $WshShell.CreateShortcut("$DesktopPath\Quantum Cyber Defense.lnk")
$Shortcut.TargetPath = "wscript.exe"
$Shortcut.Arguments = """E:\AI-Driven Quantum-Resilient Cryptographic Agility Framework for Secure Cyber Defense\start_quantum_defense.vbs"""
$Shortcut.IconLocation = "imageres.dll,203"
$Shortcut.Description = "Launch Autonomous AI Cyber Defense Platform"
$Shortcut.Save()
Write-Host "Desktop shortcut created successfully."
