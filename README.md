# Key Generation Script for Android Build

This script automates the process of generating the necessary keys for building Android or LineageOS. The keys are used to sign the Android build.

[Author](https://github.com/akmacc)

[Original Script ](https://github.com/akmacc/Key-Gen-signed-script)

## Script Overview

The script performs the following steps:

1. **Generates keys for the specified build type**.
2. **Moves the keys to the appropriate directory**.
3. **Sets up the keys for use in the build process**.

## Usage

### Running the Script

1. **Make the script executable**:
   ```sh
   Move the script to source root directory
   chmod +x generate_all_keys.sh
   ./generate_all_keys.sh

2. **Device Tree Adaption**:
[Vendorsetup](https://github.com/ofcsayan/device_xiaomi_spes/commit/c50422f702131b186f6a3ffb0e908f4cbd6920b6)
