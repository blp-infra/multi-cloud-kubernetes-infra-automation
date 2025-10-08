[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

# 🌍 Multi-Cloud Kubernetes Infrastructure Automation

## 📌 Overview

This project provisions and manages **Kubernetes clusters across AWS (EKS) and GCP (GKE)** using **Terraform**, and deploys a complete DevOps toolchain inside the clusters for **infrastructure automation, monitoring, CI/CD, and security**.

The goal is to demonstrate a **multi-cloud strategy** where Kubernetes serves as the common orchestration layer across cloud providers.

---

## 🎯 Features

✅ **Multi-Cloud Infrastructure** – Provision AWS EKS and GCP GKE clusters with Terraform.
✅ **Infrastructure Automation** – Python scripts (containerized) for AWS (boto3) and GCP (google-cloud SDK) operations, plus Kubernetes API automation.
✅ **Monitoring** – Prometheus + Grafana dashboards across clusters.
✅ **CI/CD** – Jenkins deployed inside Kubernetes for automated pipelines.
✅ **Code Quality & Security** – SonarQube integration for static code analysis, Trivy for container vulnerability scanning.
✅ **Secrets Management** – Kubernetes secrets (can be extended with Vault).
✅ **Scalable Architecture** – Easily extendable to other clouds.

---

## 🏗️ Architecture

```
┌──────────────────────────────────────────────────────────┐
│                      Terraform (IaC)                      │
│ Provisions EKS, GKE, AKS, OKE & IKS Kubernetes Clusters  │
└──────────────────────────────────────────────────────────┘
           │        │        │        │        │                     
  ┌────────┘        │        │        │        │         └─────────┐
  ▼                 ▼        ▼        ▼                          ▼
┌───────────────────┐ ┌───────────────────┐ ┌───────────────────┐ ┌───────────────────┐ ┌───────────────────┐
│   AWS EKS (K8s)   │ │   GCP GKE (K8s)   │ │  Azure AKS (K8s)  │ │   OCI OKE (K8s)   │ │ IBM IKS (K8s)     │
└───────────────────┘ └───────────────────┘ └───────────────────┘ └───────────────────┘ └───────────────────┘
  │                 │                 │                   │                   │
┌──────────┼───────────┐     │     ┌───────────┼───────────┐       │       ┌───────────┼───────────┐
▼          ▼           ▼     ▼     ▼           ▼           ▼       ▼       ▼           ▼           ▼
Jenkins   SonarQube    Trivy Jenkins SonarQube   Trivy   Jenkins SonarQube   Trivy   Jenkins SonarQube   Trivy
(CI/CD)   (Code QA)    (Sec) (CI/CD) (Code QA)   (Sec)   (CI/CD) (Code QA)   (Sec)   (CI/CD) (Code QA)   (Sec)

└───────────────────────────┬───────────────┬───────────────┬───────────────┬──────────────────────────┘
                   ▼               ▼               ▼               ▼
          Prometheus + Grafana Monitoring (Unified Multi-Cluster Dashboards)


```

---

## 🛠️ Tech Stack

### 🔹 Infrastructure & Orchestration

* Terraform
* Ansible
* AWS EKS
* GCP GKE
* Azure AKS
* Oracle OKE 
* IBM Cloud
* Kubernetes 

### 🔹 Automation & Scripting

* Python (`boto3`, `google-cloud-sdk`, `kubernetes`, `pyyaml`, `requests`)
* Docker (for containerizing Python automation)

### 🔹 DevOps Toolchain

* Jenkins (CI/CD)
* SonarQube (Code Quality)
* Trivy (Container Security Scanning)

### 🔹 Monitoring & Logging

* Prometheus
* Grafana

---

## 📂 Repository Structure

```
multi-cloud-kubernetes-infra-automation/
├── README.md
├── .gitignore
├── .terraform-version
├── Makefile
  terraform/
  │
  ├── global/
  │   ├── variables/
  │   │   ├── dev/
  │   │   │   ├── main.tfvars
  │   │   │   └── state.tfvars
  │   │   ├── staging/
  │   │   │   ├── main.tfvars
  │   │   │   └── state.tfvars
  │   │   └── prod/
  │   │       ├── main.tfvars
  │   │       └── state.tfvars
  │   └── common/
  │       ├── common.tfvars
  │       └── shared-variables.tf
  │
  ├── environments/
  │   ├── dev/
  │   │   ├── main.tf
  │   │   ├── variables.tf
  │   │   ├── outputs.tf
  │   │   ├── backend.tf
  │   │   └── providers.tf
  │   ├── staging/
  │   │   ├── main.tf
  │   │   ├── variables.tf
  │   │   ├── outputs.tf
  │   │   ├── backend.tf
  │   │   └── providers.tf
  │   └── prod/
  │       ├── main.tf
  │       ├── variables.tf
  │       ├── outputs.tf
  │       ├── backend.tf
  │       └── providers.tf
  │
  ├── modules/
  │   ├── aws/
  │   │   ├── compute/
  │   │   │   ├── ec2/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── ecs/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── eks/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   └── lambda/
  │   │   │       ├── main.tf
  │   │   │       ├── variables.tf
  │   │   │       ├── outputs.tf
  │   │   │       └── versions.tf
  │   │   ├── networking/
  │   │   │   ├── vpc/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── security-groups/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── load-balancer/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   └── cloudfront/
  │   │   │       ├── main.tf
  │   │   │       ├── variables.tf
  │   │   │       ├── outputs.tf
  │   │   │       └── versions.tf
  │   │   ├── storage/
  │   │   │   ├── s3/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   └── efs/
  │   │   │       ├── main.tf
  │   │   │       ├── variables.tf
  │   │   │       ├── outputs.tf
  │   │   │       └── versions.tf
  │   │   ├── database/
  │   │   │   ├── rds/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── dynamodb/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   └── elasticache/
  │   │   │       ├── main.tf
  │   │   │       ├── variables.tf
  │   │   │       ├── outputs.tf
  │   │   │       └── versions.tf
  │   │   ├── monitoring/
  │   │   │   ├── cloudwatch/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   └── sns/
  │   │   │       ├── main.tf
  │   │   │       ├── variables.tf
  │   │   │       ├── outputs.tf
  │   │   │       └── versions.tf
  │   │   ├── security/
  │   │   │   ├── iam/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── secrets-manager/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   └── kms/
  │   │   │       ├── main.tf
  │   │   │       ├── variables.tf
  │   │   │       ├── outputs.tf
  │   │   │       └── versions.tf
  │   │   └── management/
  │   │       ├── cloudtrail/
  │   │       │   ├── main.tf
  │   │       │   ├── variables.tf
  │   │       │   ├── outputs.tf
  │   │       │   └── versions.tf
  │   │       └── config/
  │   │           ├── main.tf
  │   │           ├── variables.tf
  │   │           ├── outputs.tf
  │   │           └── versions.tf
  │   │
  │   ├── azure/
  │   │   ├── compute/
  │   │   │   ├── vm/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── vmss/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── aks/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── container-instances/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   └── functions/
  │   │   │       ├── main.tf
  │   │   │       ├── variables.tf
  │   │   │       ├── outputs.tf
  │   │   │       └── versions.tf
  │   │   ├── networking/
  │   │   │   ├── vnet/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── nsg/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── load-balancer/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── application-gateway/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   └── cdn/
  │   │   │       ├── main.tf
  │   │   │       ├── variables.tf
  │   │   │       ├── outputs.tf
  │   │   │       └── versions.tf
  │   │   ├── storage/
  │   │   │   ├── storage-account/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   └── disk/
  │   │   │       ├── main.tf
  │   │   │       ├── variables.tf
  │   │   │       ├── outputs.tf
  │   │   │       └── versions.tf
  │   │   ├── database/
  │   │   │   ├── sql/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── cosmos-db/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   └── redis/
  │   │   │       ├── main.tf
  │   │   │       ├── variables.tf
  │   │   │       ├── outputs.tf
  │   │   │       └── versions.tf
  │   │   ├── monitoring/
  │   │   │   ├── monitor/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   └── log-analytics/
  │   │   │       ├── main.tf
  │   │   │       ├── variables.tf
  │   │   │       ├── outputs.tf
  │   │   │       └── versions.tf
  │   │   ├── security/
  │   │   │   ├── key-vault/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── identity/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   └── security-center/
  │   │   │       ├── main.tf
  │   │   │       ├── variables.tf
  │   │   │       ├── outputs.tf
  │   │   │       └── versions.tf
  │   │   └── management/
  │   │       ├── resource-group/
  │   │       │   ├── main.tf
  │   │       │   ├── variables.tf
  │   │       │   ├── outputs.tf
  │   │       │   └── versions.tf
  │   │       └── policy/
  │   │           ├── main.tf
  │   │           ├── variables.tf
  │   │           ├── outputs.tf
  │   │           └── versions.tf
  │   │
  │   ├── gcp/
  │   │   ├── compute/
  │   │   │   ├── vm/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── gke/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── cloud-run/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   └── cloud-functions/
  │   │   │       ├── main.tf
  │   │   │       ├── variables.tf
  │   │   │       ├── outputs.tf
  │   │   │       └── versions.tf
  │   │   ├── networking/
  │   │   │   ├── vpc/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── firewall/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── load-balancer/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   └── cdn/
  │   │   │       ├── main.tf
  │   │   │       ├── variables.tf
  │   │   │       ├── outputs.tf
  │   │   │       └── versions.tf
  │   │   ├── storage/
  │   │   │   ├── gcs/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   └── disk/
  │   │   │       ├── main.tf
  │   │   │       ├── variables.tf
  │   │   │       ├── outputs.tf
  │   │   │       └── versions.tf
  │   │   ├── database/
  │   │   │   ├── cloud-sql/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── firestore/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   └── memorystore/
  │   │   │       ├── main.tf
  │   │   │       ├── variables.tf
  │   │   │       ├── outputs.tf
  │   │   │       └── versions.tf
  │   │   ├── monitoring/
  │   │   │   ├── monitoring/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   └── logging/
  │   │   │       ├── main.tf
  │   │   │       ├── variables.tf
  │   │   │       ├── outputs.tf
  │   │   │       └── versions.tf
  │   │   ├── security/
  │   │   │   ├── iam/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   ├── secret-manager/
  │   │   │   │   ├── main.tf
  │   │   │   │   ├── variables.tf
  │   │   │   │   ├── outputs.tf
  │   │   │   │   └── versions.tf
  │   │   │   └── kms/
  │   │   │       ├── main.tf
  │   │   │       ├── variables.tf
  │   │   │       ├── outputs.tf
  │   │   │       └── versions.tf
  │   │   └── management/
  │   │       ├── project/
  │   │       │   ├── main.tf
  │   │       │   ├── variables.tf
  │   │       │   ├── outputs.tf
  │   │       │   └── versions.tf
  │   │       └── org-policy/
  │   │           ├── main.tf
  │   │           ├── variables.tf
  │   │           ├── outputs.tf
  │   │           └── versions.tf
  │   │
  │   └── shared/
  │       ├── naming/
  │       │   ├── main.tf
  │       │   ├── variables.tf
  │       │   ├── outputs.tf
  │       │   └── versions.tf
  │       ├── tagging/
  │       │   ├── main.tf
  │       │   ├── variables.tf
  │       │   ├── outputs.tf
  │       │   └── versions.tf
  │       └── data-sources/
  │           ├── main.tf
  │           ├── variables.tf
  │           ├── outputs.tf
  │           └── versions.tf
  │
├── scripts/
│   ├── deploy.sh
│   ├── init.sh
│   ├── plan.sh
│   ├── apply.sh
│   ├── destroy.sh
│   └── validate.sh
│
├── policies/
│   ├── aws/
│   │   ├── security-policies/
│   │   │   ├── s3-bucket-policies.json
│   │   │   ├── ec2-security-policies.json
│   │   │   └── iam-baseline-policies.json
│   │   └── compliance-policies/
│   │       ├── soc2-compliance.json
│   │       ├── pci-compliance.json
│   │       └── hipaa-compliance.json
│   ├── azure/
│   │   ├── security-policies/
│   │   │   ├── storage-account-policies.json
│   │   │   ├── vm-security-policies.json
│   │   │   └── rbac-baseline-policies.json
│   │   └── compliance-policies/
│   │       ├── soc2-compliance.json
│   │       ├── pci-compliance.json
│   │       └── gdpr-compliance.json
│   └── gcp/
│       ├── security-policies/
│       │   ├── gcs-bucket-policies.yaml
│       │   ├── compute-security-policies.yaml
│       │   └── iam-baseline-policies.yaml
│       └── compliance-policies/
│           ├── soc2-compliance.yaml
│           ├── pci-compliance.yaml
│           └── gdpr-compliance.yaml
│
├── docs/
│   ├── architecture/
│   │   ├── high-level-design.md
│   │   ├── network-topology.md
│   │   ├── security-architecture.md
│   │   └── data-flow-diagrams.md
│   ├── runbooks/
│   │   ├── deployment-procedure.md
│   │   ├── incident-response.md
│   │   ├── backup-restore.md
│   │   └── scaling-procedures.md
│   ├── troubleshooting/
│   │   ├── terraform-issues.md
│   │   ├── provider-errors.md
│   │   ├── networking-problems.md
│   │   └── state-management.md
│   └── best-practices/
│       ├── coding-standards.md
│       ├── security-guidelines.md
│       ├── naming-conventions.md
│       └── deployment-guidelines.md
│
└── tests/
    ├── unit/
    │   ├── aws/
    │   │   ├── vpc_test.go
    │   │   ├── ec2_test.go
    │   │   └── s3_test.go
    │   ├── azure/
    │   │   ├── vnet_test.go
    │   │   ├── vm_test.go
    │   │   └── storage_test.go
    │   └── gcp/
    │       ├── vpc_test.go
    │       ├── compute_test.go
    │       └── gcs_test.go
    ├── integration/
    │   ├── aws-integration_test.go
    │   ├── azure-integration_test.go
    │   └── gcp-integration_test.go
    └── e2e/
        ├── full-stack_test.go
        ├── multi-cloud_test.go
        └── disaster-recovery_test.go
```

---

## 🚀 Getting Started

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/<your-username>/multi-cloud-kubernetes-infra-automation.git
cd multi-cloud-kubernetes-infra-automation
```

### 2️⃣ Provision Infrastructure with Terraform

* Configure AWS credentials (`~/.aws/credentials`)
* Configure GCP credentials (`gcp-service-account.json`)
* Run:

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

### 3️⃣ Deploy Kubernetes Toolchain

```bash
kubectl apply -f k8s-manifests/jenkins/
kubectl apply -f k8s-manifests/sonarqube/
kubectl apply -f k8s-manifests/trivy/
kubectl apply -f k8s-manifests/prometheus/
kubectl apply -f k8s-manifests/grafana/
```

### 4️⃣ Run Python Automation in Kubernetes

* Build & push Docker image:

```bash
cd python-automation
docker build -t <registry>/py-automation:latest .
docker push <registry>/py-automation:latest
```

* Deploy to Kubernetes:

```bash
kubectl apply -f k8s-manifests/automation-deployment.yaml
```

---

## 📊 Monitoring & Dashboards

* Access **Grafana** dashboards via `kubectl port-forward`.
* Prometheus scrapes metrics from both clusters.

---

## 🔐 Security

* SonarQube for static code analysis.
* Trivy scans container images inside Kubernetes.
* Future enhancement: Integrate HashiCorp Vault for secrets.

---

## 🎯 Roadmap

* [ ] Add multi-cluster federation (KubeFed)
* [ ] Integrate ELK Stack for centralized logging
* [ ] Add ArgoCD for GitOps workflows
* [ ] Implement multi-region DR setup

---
## License

This project is licensed under the [GNU General Public License v3.0](LICENSE).  
You are free to use, modify, and distribute this project under the same license.


