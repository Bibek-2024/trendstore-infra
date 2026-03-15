🛒 TrendStore E-Commerce DevOps Project
![AWS](https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white) ![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white) ![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=jenkins&logoColor=white) ![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white) ![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)

**Automating the Deployment & Monitoring of a Production-Grade React Application on AWS EKS Cluster.**

---

## 📌 Table of Contents
- [Overview](#-overview)
- [Project Structure](#-project-structure)
- [Infrastructure Architecture](#-infrastructure-architecture)
- [CI/CD Pipeline Details](#-cicd-pipeline-details)
- [Monitoring & Alerting](#-monitoring--alerting)
- [How to Run This Project](#-how-to-run-this-project)
- [Author & Contact](#-author--contact)

---

## 📖 Overview
This project showcases a complete **DevOps Lifecycle** for the TrendStore ReactJS application. It utilizes **Infrastructure as Code (Terraform)** to provision a custom AWS VPC and EKS Cluster, and implements a **Pipeline-as-Code** model using Jenkins for seamless automated deployments.

---

## 📂 Project Structure
```text
.
├── main.tf                     # Infrastructure entry point
├── variables.tf                # AWS & EKS Variables
├── Dockerfile                  # Multi-stage build (Vite/React)
├── Jenkinsfile                 # Declarative CI/CD Pipeline
├── dist/                       # Minified production assets
├── kubernetes/                 # K8s Manifests
│   ├── deployment.yaml         # Trendstore-deployment (2 Replicas)
│   └── service.yaml            # LoadBalancer config
├── monitoring/                 # Monitoring Stack
│   └── prometheus-values.yaml  # Helm configuration for Prometheus
└── terraform.tfstate           # Current infrastructure state

Gemini said
Building a clean and structured directory tree in your README.md is a great way to showcase the organization of your TrendStore repository. It proves to recruiters and hiring managers that your project is production-ready and modular.

Here is the updated Markdown code including your specific folder structure and the end-to-end architecture description.

Markdown
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
