#!/bin/bash
today=`date '+%Y_%m_%d__%H_%M_%S'`;
filename="./log/Result_$today.log"
clear
echo "Please kindly export your access_key/secret_key to environment variable before use this script"
echo "======================================================================================================="
echo "export TF_VAR_access_key=<your access key>"
echo "export TF_VAR_secret_key=<your secret key>"
echo "======================================================================================================="
echo "Your current environment variable now:"
echo "======================================================================================================="
echo "TF_VAR_access_key:"
echo $TF_VAR_access_key
echo "TF_VAR_secret_key:"
echo $TF_VAR_secret_key
echo "======================================================================================================="
echo "Please input 'Yes'. If you already check and confirm the environment variable."
echo "======================================================================================================="
read answer
if [ "${answer}" ]; then
if [ "${answer}" != 'Yes' ]; then
exit
fi
else
exit
fi
if [ -z "$TF_VAR_access_key" ]; then
echo "======================================================================================================="
echo "Detect: Empty Access Key or Secret Key !!!. Program will exit"
echo "======================================================================================================="
exit
fi
if [ -z "$TF_VAR_secret_key" ]; then
echo "======================================================================================================="
echo "Detect: Empty Access Key or Secret Key !!!. Program will exit"
echo "======================================================================================================="
exit
fi
echo "====================================Finished to Set Credential=========================================="
echo "===================================Import Global Configuration=========================================="
cp ../../global_variable.auto.tfvars ./global_variable.auto.tfvars
echo "=================================Start Execution Process Now !!!========================================"
./99_automate.sh >> $filename
cp ../../global_variable.auto.tfvars ./global_variable.auto.tfvars
echo "=================================Generate Output !!!===================================================="
terraform output > inventory_lab.txt
terraform output
echo "=================================Generate Output !!!===================================================="
echo "===============================Finished Execution Process Now !!!======================================="