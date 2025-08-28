# DevOps Git Workflows - Sreenath92

## Feature Branch Workflow for DevOps Projects

### 1. Feature Development Workflow
```bash
# Start from main branch
git checkout main
git pull origin main

# Create feature branch for new DevOps component
git checkout -b feature/docker-optimization

# Work on your feature
# ... make changes to Dockerfiles, configs, etc.

# Stage and commit changes
git add .
git commit -m "feat: optimize Docker multi-stage build for faster deployments"

# Push feature branch
git push origin feature/docker-optimization

# Create Pull Request on GitHub
# After review and approval, merge to main
git checkout main
git merge feature/docker-optimization
git push origin main

# Clean up feature branch
git branch -d feature/docker-optimization
git push origin --delete feature/docker-optimization
```

### 2. DevOps Release Workflow
```bash
# Create release branch
git checkout -b release/v1.0.0 main

# Finalize version configurations
# Update version numbers, documentation
git commit -m "chore: prepare release v1.0.0"

# Merge to main and tag
git checkout main
git merge release/v1.0.0
git tag -a v1.0.0 -m "Release version 1.0.0 - Docker containerization complete"
git push origin main --tags

# Clean up release branch
git branch -d release/v1.0.0
```

### 3. Hotfix Workflow for Production Issues
```bash
# Create hotfix branch from main
git checkout -b hotfix/security-patch main

# Fix critical issue
git commit -m "fix: patch security vulnerability in container"

# Merge to main
git checkout main
git merge hotfix/security-patch
git tag -a v1.0.1 -m "Hotfix v1.0.1 - Security patch"
git push origin main --tags

# Clean up
git branch -d hotfix/security-patch
```

## DevOps-Specific Git Hooks

### Pre-commit Hook (Quality Checks)
```bash
#!/bin/bash
# .git/hooks/pre-commit

echo "🔍 Running DevOps pre-commit checks..."

# Check for large files
find . -size +10M -type f ! -path "./.git/*" -exec echo "⚠️  Large file: {}" \;

# Validate Dockerfile syntax
find . -name "Dockerfile*" -exec docker run --rm -i hadolint/hadolint < {} \;

# Check for secrets in code
if grep -r "password\|secret\|key" . --exclude-dir=.git --exclude="*.md"; then
    echo "⚠️  Potential secrets found in code"
fi

echo "✅ Pre-commit checks completed"
```

## Commit Message Conventions for DevOps

```
feat: add new Docker service configuration
fix: resolve container networking issue  
docs: update deployment documentation
style: format Docker compose files
refactor: optimize CI/CD pipeline structure
test: add health check tests
chore: update dependency versions
```

## Branch Naming Conventions

- `feature/docker-optimization`
- `feature/jenkins-pipeline`
- `hotfix/container-security`
- `release/v1.0.0`
- `experiment/kubernetes-setup`
