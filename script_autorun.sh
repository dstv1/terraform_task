#!/bin/bash

# Step 1: Clone the Git repository
echo "Cloning the Git repository..."
git clone https://github.com/dstv1/main.git $HOME/mytask
if [ $? -ne 0 ]; then
  echo "Failed to clone the repository."
  exit 1
fi

# Step 2: Navigate into the cloned directory
echo "Changing directory to $HOME/mytask..."
cd $HOME/mytask
if [ $? -ne 0 ]; then
  echo "Failed to change directory."
  exit 1
fi

# Step 3: Create the terraform.tfvars file
echo "Creating terraform.tfvars file..."
echo 'mytf_api_token = "xI7NbDHdlZl2dg.atlasv1.Lexhl2zqRrWFzr5rbP1EYgzhp2ON9cOVF9iZpJutTmRRhnCdsphuRDFpSTB8YxRSpEs"
gh_token = "ot-oyXSrEvWv5dYiwsA"
var-test1 = "testing-testing"' > $HOME/mytask/terraform.tfvars
if [ $? -ne 0 ]; then
  echo "Failed to create terraform.tfvars file."
  exit 1
fi

# Step 4: Initialize Terraform
echo "Initializing Terraform..."
terraform init
if [ $? -ne 0 ]; then
  echo "Failed to initialize Terraform."
  exit 1
fi

# Step 5: Apply Terraform configuration
echo "Applying Terraform configuration..."
terraform apply -auto-approve
if [ $? -ne 0 ]; then
  echo "Failed to apply Terraform configuration."
  exit 1
fi

echo "Script completed successfully!"