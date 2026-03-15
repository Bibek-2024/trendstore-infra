# 🚀 TrendStore: End-to-End Cloud-Native DevOps Project

An enterprise-grade CI/CD implementation for a React application, featuring Infrastructure as Code (IaC), automated scaling on AWS EKS, and a sophisticated monitoring/alerting stack.

---

## 🏗 **Project Architecture**
The infrastructure is built on **AWS** using **Terraform**, orchestrated by **Jenkins**, and monitored by **Prometheus & Grafana**.

* **Frontend:** React.js (Vite)
* **CI/CD:** Jenkins (Pipeline-as-Code)
* **Orchestration:** Amazon EKS (Kubernetes)
* **IaC:** Terraform (Modular Setup)
* **Monitoring:** Prometheus & Grafana (Alerting via Gmail)

---

## 📁 **Project Structure**

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
🛠 Core Components & Implementation
1️⃣ Infrastructure as Code (IaC)
Provisioned the entire cloud backbone using Terraform:

VPC: Custom Virtual Private Cloud with Public/Private subnets.

EKS Cluster: Managed Kubernetes service for high-availability hosting.

2️⃣ Continuous Integration (CI)
Dockerization: Created a multi-stage Dockerfile to optimize the Vite-built React application.

GitHub Webhook: Configured automatic triggers to start the Jenkins pipeline on every commit.

3️⃣ Continuous Deployment (CD)
LoadBalancer: Exposed the application via an AWS Elastic Load Balancer (ELB) using Kubernetes Services.

Zero-Downtime: Implemented rolling updates via deployment.yaml.

4️⃣ Observability & Alerting
Grafana Dashboards: Custom-built gauges for Pod Availability and resource usage.

Email Alerting: Configured SMTP notifications to trigger professional alerts (🚨 [FIRING]) to Gmail.

👨‍💻 Author
Bibek Kumar Sahu Aspiring DevOps & Cloud Infrastructure Engineer

This project was completed as part of an end-to-end DevOps training certification.
