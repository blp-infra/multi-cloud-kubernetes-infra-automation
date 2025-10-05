#!/bin/bash
# ============================================
# scripts/init.sh 
# Initializing script for terraform with backend configuration
# ==============================

set -e 
# Color  for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the environment from the argument  or default to dev
# 
ENVIRONMENT=${1:-dev}

# Get the script directory and project root
#SCRIPT_DIR="$(cd  /terraform/environments/dev)"
cd  ../terraform/environments/dev/
terraform init $() -backend-config=../../global/variables/dev/state.tfvars ; 
