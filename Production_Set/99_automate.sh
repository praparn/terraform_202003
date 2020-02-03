#!/bin/bash
echo "==================================Start Terraform Initialzation==============================================="
terraform init
echo "====================================Start Check Terraform's Format============================================="
terraform fmt -check
echo "====================================Start Validation==========================================================="
erraform validate
echo "=====================================Start Terraform Apply=============================================="
terraform apply -auto-approve -parallelism=5 -refresh=true ./
echo "================================Finished Automate Terraform Process====================================="