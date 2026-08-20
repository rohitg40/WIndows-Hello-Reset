# 🔐 Windows Hello Reset 

PowerShell utility to reset the Windows Hello credential container for the current Windows user.

Useful when Windows Hello PIN, fingerprint, or facial recognition is not working or cannot be reconfigured.

## 💻 Supported

* Windows 10
* Windows 11
* Microsoft Entra ID joined devices
* Hybrid/domain joined devices
* Standalone Windows PCs
* Personal Windows PCs
* Local Windows accounts
* Microsoft accounts

## ⚙️ How It Works

The script uses Microsoft's built-in:

```
certutil.exe -DeleteHelloContainer
```

This removes the existing Windows Hello credential container for the current user.

After the reset, the user signs out, signs back in using their password, and configures Windows Hello again.

## 🚀 Usage

1. Sign in as the affected Windows user.

2. Open PowerShell.

3. Run `Windows Hello Reset.ps1`.

4. Type `RESET` when prompted.

5. Sign out of Windows.

6. Sign back in using your password.

7. Go to:

   Settings > Accounts > Sign-in options

8. Configure Windows Hello again.

## ⚠️ Important

This is a destructive reset.

Make sure the user has another valid sign-in method before running the script.

On newer Windows 11 versions, deleting the Windows Hello container may also remove passkeys and WebAuthn/FIDO credentials stored in the same container.

## 👤 User Context

The script must be run by the affected Windows user.

Do not run it as:

* SYSTEM
* LocalSystem
* An Intune device/system script
* Another administrator account

The Windows Hello container belongs to the user running the script.

## 🚫 What This Script Does Not Do

This script does not:

* Clear the TPM
* Remove the device from Microsoft Entra ID
* Remove the device from Intune
* Remove the Windows user account
* Change Windows Hello policy
* Modify Group Policy
* Modify registry settings
* Delete biometric drivers

## 🛠️ Troubleshooting

### ❌ "Object was not found"

If the script returns:

```
NTE_NOT_FOUND
Object was not found
```

there may be no Windows Hello credential container available for the current user.

### 🔧 Windows Hello Still Cannot Be Configured

If the reset succeeds but Windows Hello cannot be configured afterward, check:

* Windows Hello policy
* Microsoft Entra ID configuration
* Intune configuration
* TPM
* Biometric hardware/driver
* Windows components
* Account authentication

This script only resets the existing Windows Hello credential container.

## 📌 Disclaimer

Use this utility at your own risk.

Always ensure that an alternative sign-in method is available before resetting Windows Hello.
