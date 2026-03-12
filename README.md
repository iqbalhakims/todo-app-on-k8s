# Todo App

A simple browser-based todo application containerized with Docker and deployed to DigitalOcean Kubernetes via a GitHub Actions CI/CD pipeline.

## What It Does

A lightweight frontend-only task manager built with vanilla HTML, CSS, and JavaScript. No backend, no database — tasks live in memory during the session.

**Features:**
- Add tasks by typing and pressing Enter or clicking "Add Task"
- Mark tasks as done (strikethrough toggle) by clicking on them
- Delete tasks with the ❌ button

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | HTML5, CSS3, Vanilla JavaScript |
| Testing | Jest 29 + jsdom |
| Container | Docker (nginx:alpine) |
| Registry | DigitalOcean Container Registry |
| Orchestration | Kubernetes (DigitalOcean managed) |
| Infrastructure | Terraform + Terraform Cloud |
| CI/CD | GitHub Actions |

## Project Structure

```
todoapp/
├── app/                  # Frontend source
│   ├── index.html
│   ├── app.js
│   └── style.css
├── infra/
│   └── terraform/        # Kubernetes cluster provisioning
│       ├── main.tf
│       ├── variables.tf
│       ├── versions.tf
│       └── outputs.tf
├── .github/
│   └── workflows/
│       └── ci.yml        # CI/CD pipeline
├── Dockerfile
└── package.json
```

## CI/CD Pipeline

On every push to `main`, GitHub Actions:
1. **Test** — installs dependencies and runs `npm test` (Jest)
2. **Build** — builds a Docker image tagged with the commit SHA and `latest`
3. **Push** — pushes both tags to DigitalOcean Container Registry

Pull requests only run the test job.

### Required Secrets

| Secret | Description |
|--------|-------------|
| `DIGITALOCEAN_ACCESS_TOKEN` | DigitalOcean API token for `doctl` |
| `DO_REGISTRY_NAME` | DigitalOcean container registry name |

## Infrastructure

Terraform provisions a managed Kubernetes cluster on DigitalOcean:

- **Region:** Singapore (`sgp1`)
- **Kubernetes:** `1.32.2-do.0`
- **Node pool:** 1 × `s-2vcpu-2gb` (configurable)
- **Terraform Cloud workspace:** `todo-app-on-k8s` (org: `iqbal-hakim`)

```bash
cd infra/terraform
terraform init
terraform apply
```

## Local Development

```bash
# Serve the app locally (any static file server works)
npx serve app/

# Run tests
npm test

# Build Docker image
docker build -t todoapp .
docker run -p 8080:80 todoapp
# Open http://localhost:8080
```

## Changelog

### Features
- **First draft** — initial todo app with add, toggle, and delete task functionality
- **CI pipeline** — GitHub Actions workflow for test, build, and push to DigitalOcean Container Registry
- **Gitignore** — added `.gitignore` to exclude `node_modules` and build artifacts
- **package-lock.json** — locked dependency versions for reproducible installs
- **Terraform** — infrastructure-as-code to provision DigitalOcean Kubernetes cluster

### Bug Fixes
- **Remove node_modules** — removed accidentally committed `node_modules` directory from the repo
- **Jest no-tests** — fixed CI failure when no test files exist by passing `--passWithNoTests`
- **DO token** — fixed missing DigitalOcean access token secret reference in CI workflow
- **Workspace naming** — corrected Terraform Cloud workspace name
