# 🚀 Full CI/CD DevSecOps Template for Dockerized Microservices

A complete production-grade template to build, scan, test, and deploy a microservices architecture using Docker Compose, Jenkins, SonarQube, OWASP Dependency-Check, and Trivy — topped with automated CI/CD workflows.

This project mirrors a real-world enterprise environment with NGINX, .NET Core APIs, Redis, Cube.js analytics engine, and API Gateway services.

---

## ✨ Features

- 🐳 Docker Compose setup with microservices (`nginx`, `.NET Core APIs`, `Cube.js`, `Redis`)
- 🔐 Security Scanning with:
  - [Trivy](https://github.com/aquasecurity/trivy) - Image & config vulnerabilities
  - [OWASP Dependency-Check](https://owasp.org/www-project-dependency-check/) - Dependency vulnerabilities
- 📊 Code Quality & Coverage with:
  - [SonarQube](https://www.sonarsource.com/products/sonarqube/)
- ⚙️ CI/CD Automation with:
  - Jenkins pipeline (`Jenkinsfile`) to:
    - Lint + Build Docker images
    - Run security scans
    - Push to Docker Registry
    - Deploy via `docker-compose`
- 📁 Organized Service Volumes & Configuration
- 🌍 Ready-to-deploy on any Linux server

---

## 🛠️ Stack

| Tool | Purpose |
|------|---------|
| Docker Compose | Local orchestration |
| Jenkins | CI/CD pipeline |
| SonarQube | Static code analysis |
| Trivy | Docker image vulnerability scan |
| OWASP DC | Dependency security scan |
| NGINX | Reverse proxy |
| .NET Core | API backend |
| Redis | In-memory DB |
| Cube.js | Analytics & dashboard backend |

---

## 🧱 Folder Structure

cms-synergy-docker-devsecops-template/
├── docker-compose.yml
├── Jenkinsfile
├── nginx/
│ ├── nginx.conf
│ ├── proxy.conf
│ ├── mime.types
│ └── ssl/
├── appsettings/
│ ├── api/
│ ├── api-gateway/
│ └── web/
├── cubejs-new/
│ ├── .env
│ └── cube/
├── security/
│ ├── trivy-scan.sh
│ ├── dependency-check/
│ └── sonar/
│ └── sonar-project.properties
├── jenkins/
│ ├── Dockerfile
│ ├── plugins.txt
│ └── jobs/
├── scripts/
│ └── deploy.sh
└── README.md