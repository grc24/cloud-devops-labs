# 💼 Cloud & DevOps Hands-On Labs

Une série de laboratoires pour maîtriser les outils et technologies liés au poste DevOps Cloud mentionné. Chaque section ci-dessous propose des étapes pratiques accompagnées de commentaires explicatifs pour mieux comprendre les concepts et actions.

---

## 🧱 1. Infrastructure as Code avec Terraform & AWS

### Objectif
Déployer un environnement complet sur AWS : réseau, base de données, cluster EKS.

### Étapes
- [ ] Initier un dépôt Terraform dans `infra/terraform` pour centraliser l'IaC.
- [ ] Créer un VPC avec :
  - 2 subnets publics (pour ALB ou bastion host).
  - 2 subnets privés (pour EKS nodes, RDS, etc.).
- [ ] Déployer un cluster EKS :
  - Définir les node groups (EC2) et leur autoscaling.
- [ ] Déployer une base RDS PostgreSQL dans un subnet privé pour la sécurité.
- [ ] Exposer des outputs Terraform utiles à Ansible (IP, DNS, ID).

### Bonus
- Utiliser les modules `terraform-aws-modules` pour simplifier et réutiliser le code.
- Gérer le state via S3 + DynamoDB (verrouillage concurrentiel).

---

## ⚙️ 2. Configuration Management avec Ansible

### Objectif
Configurer automatiquement les instances EC2 ou les nodes Kubernetes (hors EKS géré).

### Étapes
- [ ] Créer des rôles Ansible :
  - `roles/docker` : installation de Docker + configuration daemon.
  - `roles/k8s` : configuration kubeadm ou outils CLI.
  - `roles/nginx` : serveur proxy ou frontend.
- [ ] Utiliser un inventaire dynamique (via AWS CLI ou EC2 plugin).
- [ ] Déployer des services simples (Nginx ou Node.js) avec templates Jinja.
- [ ] Protéger les mots de passe avec `ansible-vault`.

### Bonus
- Utiliser `molecule` pour tester les rôles localement.
- Linter les playbooks avec `ansible-lint` pour assurer la qualité.

---

## 🧪 3. CI/CD avec Jenkins

### Objectif
Créer un pipeline CI/CD complet : lint, test, build image, push et déploiement.

### Étapes
- [ ] Installer Jenkins avec Docker Compose (plugin Git, Docker, Pipeline).
- [ ] Créer un `Jenkinsfile` pour :
  - [ ] Vérifier le code avec linter + tests unitaires.
  - [ ] Construire l'image Docker et tagger dynamiquement.
  - [ ] Pousser l'image sur un registre (Artifactory ou Docker Hub).
  - [ ] Déployer automatiquement sur EKS avec `kubectl` ou Helm.
- [ ] Intégrer Jenkins avec SCM Git/Bitbucket pour pipeline déclenché par commits.
- [ ] Sécuriser les credentials via Jenkins Credentials ou intégration avec Vault.

### Bonus
- Configurer les webhooks Git pour déclencher les builds.
- Créer des bibliothèques Jenkins partagées pour réutiliser les étapes.

---

## 🐳 4. Docker & Kubernetes

### Objectif
Conteneuriser et orchestrer des applications avec Docker et Kubernetes sur AWS.

### Étapes
- [ ] Créer des `Dockerfile` optimisés :
  - Utiliser les builds multi-stage.
  - Réduire la taille d’image (Alpine, node-slim, etc.).
- [ ] Créer des manifests YAML :
  - Déploiement, Service, Ingress, ConfigMap, Secret.
- [ ] Configurer l’Ingress Controller avec cert-manager pour les certificats TLS.
- [ ] Ajouter HPA et des probes readiness/liveness pour l’autoscaling et la stabilité.
- [ ] Installer Prometheus + Grafana pour la supervision.
- [ ] Utiliser EFK (Elasticsearch, Fluent Bit, Kibana) pour la centralisation des logs.

---

## 🔄 5. Migration Legacy vers Cloud

### Objectif
Refactoriser une application monolithique existante pour le cloud moderne.

### Étapes
- [ ] Choisir une app legacy (PHP + MySQL, Java, etc.).
- [ ] Créer un Dockerfile pour containeriser le monolithe.
- [ ] Identifier et extraire les composants : frontend, backend, tâches cron, etc.
- [ ] Déployer chaque composant comme un service Kubernetes.
- [ ] Migrer la base via un dump MySQL/PostgreSQL.
- [ ] Ajouter des métriques, alertes (CloudWatch ou Prometheus).

---

## 🔐 6. Sécurité & Automatisation

### Objectif
Sécuriser et automatiser la gestion des secrets, artefacts et qualité de code.

### Étapes
- [ ] Intégrer un gestionnaire de secrets : HashiCorp Vault, AWS Secrets Manager.
- [ ] Intégrer des outils de scan (Trivy pour images, Snyk pour dépendances).
- [ ] Qualité de code via SonarQube (analyse statique).
- [ ] Utiliser des hooks Git (`pre-commit`, `pre-push`) pour standardiser les validations.

---

## 📁 Structure du dépôt suggérée

```bash
cloud-devops-labs/
├── infra/                # Code Terraform
│   └── terraform/
├── ansible/              # Configuration Ansible
│   ├── inventory/
│   └── roles/
├── cicd/                 # Pipelines Jenkins & outils CI
│   └── jenkins/
├── k8s/                  # Manifests et Helm Charts
│   ├── manifests/
│   └── helm/
├── docker/               # Dockerfiles pour les apps
├── legacy-migration/     # Migration de l'app monolithique
├── security-tools/       # Scans, vaults, SonarQube
└── README.md
```

---

Souhaite-tu que je te génère les premiers fichiers (README de base, main.tf, Jenkinsfile, etc.) pour démarrer plus rapidement ?
