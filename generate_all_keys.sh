#!/bin/bash

# Prompt user for build type
echo "Please select the build type:"
echo "1. AOSP"
echo "2. LineageOS (LOS)"
read -p "Enter the build type (1 or 2): " build_type

# Check directory accordingly
    mkdir -p vendor/extra
    destination_dir="vendor/extra"
    
# Delete directory if it already exists
rm -rf ~/.android-certs

# Prompt user for subject information
echo "Please enter the following details:"
read -p "Country Shortform (C): " C
read -p "Country Longform (ST): " ST
read -p "Location (L): " L
read -p "Organization (O): " O
read -p "Organizational Unit (OU): " OU
read -p "Common Name (CN): " CN
read -p "Email Address (emailAddress): " emailAddress

# Construct subject string
subject="/C=$C/ST=$ST/L=$L/O=$O/OU=$OU/CN=$CN/emailAddress=$emailAddress"

# Create directory for certificates
mkdir -p ~/.android-certs

# Generate keys
mkdir ~/.android-certs

for x in releasekey platform shared media networkstack testkey bluetooth sdk_sandbox verifiedboot; do \
    ./development/tools/make_key ~/.android-certs/$x "$subject"; \
done

# Ensure the destination keys directory exists
mkdir -p "$destination_dir/keys"

# Move the keys to the destination directory
mv ~/.android-certs/* "$destination_dir/keys"

# Create product.mk
echo "PRODUCT_DEFAULT_DEV_CERTIFICATE := $destination_dir/keys/releasekey" > "$destination_dir/product.mk"

# Ensure correct file permissions
chmod -R 755 "$destination_dir/keys"

echo "Key generation and setup completed successfully."

