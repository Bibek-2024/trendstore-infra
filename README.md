# <p align="center">🛒 TrendStore: Cloud-Native E-Commerce DevOps Project</p>

<p align="center">
  <img src="https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white" />
  <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" />
  <img src="https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=jenkins&logoColor=white" />
  <img src="https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white" />
  <img src="https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" />
</p>

<p align="center">
  <strong>Automating the Deployment & Monitoring of a Production-Grade React Application on AWS EKS Cluster.</strong>
</p>

---

## 📌 Table of Contents
* [Overview](#-overview)
* [Tools & Technologies](#-tools--technologies)
* [Project Structure](#-project-structure)
* [Pipeline Architecture](#-pipeline-architecture)
* [Infrastructure & Deployment](#-infrastructure--deployment)
* [Monitoring & Observability](#-monitoring--alerting)
* [How to Run This Project](#-how-to-run-this-project)
* [Author & Contact](#-author--contact)

---

## 📖 Overview
This project showcases a complete **DevOps lifecycle** for a ReactJS application hosted on **AWS EKS**. It implements a **Pipeline-as-Code** model using Jenkins, ensuring that every code push is automatically validated, containerized, and deployed with zero manual intervention.

---

## 🛠 Tools & Technologies

| Category | Tools Used |
| :--- | :--- |
| **Cloud Infrastructure** | AWS (VPC, EKS, IAM, EC2) |
| **Containerization** | Docker, Multi-stage Builds |
| **CI/CD Automation** | Jenkins, GitHub Webhooks |
| **Infrastructure as Code** | Terraform |
| **Observability** | Prometheus, Grafana, Blackbox Exporter |
| **Orchestration** | Kubernetes (EKS) |

---

## 📂 Project Structure

Below is the directory structure of the TrendStore repository, organized for modular infrastructure management and efficient CI/CD workflows:

```text
.
├── Dockerfile                  # Application containerization logic
├── Jenkinsfile                 # CI/CD Pipeline as Code
├── LICENSE.txt                 # Project licensing
├── README.md                   # Project documentation
├── dist/                       # Compiled React assets (Production Build)
│   ├── assets/                 # Optimized JS, CSS, and Image files
│   ├── index.html              # Main entry point
│   └── vite.svg                # App icon
├── eks-config.yaml             # EKS cluster configuration settings
├── images/                     # Project screenshots for documentation
├── kubernetes/                 # K8s Manifests
│   ├── deployment.yaml         # App deployment logic
│   └── service.yaml            # LoadBalancer service configuration
├── monitoring/                 # Monitoring configurations
│   └── prometheus-values.yaml  # Helm values for Prometheus/Grafana
├── main.tf                     # Main Terraform entry point (VPC, IAM, EKS)
├── variables.tf                # Infrastructure variables
├── outputs.tf                  # Useful infrastructure outputs (ELB URLs)
├── providers.tf                # AWS Provider configuration
└── terraform.tfstate           # State management for infrastructure

```

---

## 🏗️ Pipeline Architecture

The diagram below illustrates the flow from a developer's machine to the live production environment hosted on Amazon EKS.

<p align="center">
<img src="./https://github.com/Bibek-2024/trendstore-infra/blob/f14bb293015c28df0cab49fad2f09f0e19c28f8c/images/TrendStore%20DevOps%20Project%20Architecture%20diagram.png" alt="Architecture Diagram" width="850">
</p>

### **🚀 CI/CD Execution Flow**

> **Developer Commit** ➔ **GitHub Webhook** ➔ **Jenkins Pipeline** ➔ **Docker Hub** ➔ **AWS EKS**

---

---

## 📊 Monitoring & Alerting

We implemented a proactive monitoring strategy to track the health of the E-commerce platform:

* **Uptime Tracking:** Using Blackbox Exporter to probe the LoadBalancer endpoint.
* **Alerting:** Configured Gmail SMTP via Grafana for instant 🚨 [FIRING] notifications if pods drop below 1.
* **Dashboards:** Real-time visualization of CPU, Memory, and Network traffic in Grafana.

---

## ⚙️ How to Run This Project

### 1. Clone & Initialize

```bash
git clone [https://github.com/Bibek-2024/trendstore-infra.git](https://github.com/Bibek-2024/trendstore-infra.git)
cd trendstore-infra


```

### 2. Provision Infrastructure

```bash
# Initialize and Validate
terraform init
terraform validate
terraform plan

# Start the Build
terraform apply -auto-approve

# Start the Destroy
terraform destroy -auto-approve

# To run the output.tf file
terraform refresh
terraform output

```

### 3. Deploy Stack

```bash
# This starts the React App, Prometheus, and Grafana
docker-compose up -d --build

```

---

## 👤 Author & Contact

### **Bibek Kumar Sahu**

*Aspiring DevOps & Cloud Infrastructure Engineer*

📫 **Email:** [bibekkumarsahu2011@gmail.com](mailto:bibekkumarsahu2011@gmail.com)
🔗 **LinkedIn:** [bibekkumarsahu](https://www.linkedin.com/in/bibekkumarsahu/)
📁 **GitHub:** [Bibek-2024](https://github.com/Bibek-2024/trendstore-infra.git)

---
