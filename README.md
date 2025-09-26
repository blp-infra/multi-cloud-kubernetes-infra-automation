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
│── README.md
│── diagrams/                  # Architecture diagrams
│
├── terraform/                 # Terraform IaC
│   ├── aws/eks/               # AWS EKS cluster
│   ├── gcp/gke/               # GCP GKE cluster
│   └── main.tf                # Root configuration
│
├── python-automation/          # Python scripts
│   ├── aws_ops/               # boto3 automation
│   ├── gcp_ops/               # google-cloud automation
│   ├── k8s_ops/               # K8s API automation
│   └── Dockerfile             # Containerize automation
│
├── k8s-manifests/              # Kubernetes manifests
│   ├── jenkins/
│   ├── sonarqube/
│   ├── trivy/
│   ├── prometheus/
│   └── grafana/
│
├── ci-cd/                      # Jenkins pipelines / GitHub Actions
│   ├── github-actions.yml
│   └── jenkinsfile
│
└── docs/                       # Documentation & guides
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


