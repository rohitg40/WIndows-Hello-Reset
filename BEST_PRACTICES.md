# 🔐 Windows Hello Reset — Best Practices

* Always make sure the user can sign in with their **password** before resetting Windows Hello.
* Run the script in the **affected user's session**.
* Do not clear the TPM as part of a normal Windows Hello reset.
* For enterprise devices, test the script on a small number of devices before wider deployment.
* Be aware that newer Windows 11 versions may remove **passkeys/WebAuthn credentials** stored in the Windows Hello container.
* After the reset, sign out and configure Windows Hello again.

For troubleshooting, check Windows Hello, TPM, device enrollment, and organizational policy if the issue continues.
