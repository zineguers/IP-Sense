## Features
- Batch scan up to 20 IPv4 addresses
- Geolocation, ASN, ISP, organization data
- Proxy/VPN/hosting provider detection
- Simple risk scoring (0-100%)
- Persistent scan history (timestamped)
- One-click external lookups (AbuseIPDB, Scamalytics fraud score, BrightCloud)
- Clean dark-mode UI with animations

<img width="1228" height="862" alt="image" src="https://github.com/user-attachments/assets/e8d33e26-7fdf-48ac-afc1-4cd6a508f0c4" />

## Prerequisites
- Windows PowerShell 5.1+ (built-in on Windows 10/11)
- Internet connection

## How to Use
1. Download `IP Sense.ps1`
2. **Unblock the file**: Right-click → Properties → check "Unblock" → Apply  
   (Or run in PowerShell: `Unblock-File ".\IP Sense.ps1"`)
3. Run the script:
   ```powershell
   powershell.exe -ExecutionPolicy Bypass -File ".\IP Sense.ps1"
   
