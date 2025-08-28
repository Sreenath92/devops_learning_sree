#!/bin/bash

# DevOps Learning Setup Script - Manual Version
# For use when GitHub CLI has connectivity issues

set -e
echo "🚀 Setting up DevOps Learning Repository Structure..."

# Check if we're in the right directory
if [ ! -d ".git" ]; then
    echo "⚠️  This doesn't appear to be a Git repository."
    echo "📋 Please run these commands first:"
    echo "   git init"
    echo "   git remote add origin git@github.com:Sreenath92/devops_learning_sree.git"
    echo ""
    echo "❓ Do you want me to initialize Git here? (y/n)"
    read -r response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        git init
        git remote add origin git@github.com:Sreenath92/devops_learning_sree.git
        echo "✅ Git initialized!"
    else
        echo "❌ Please initialize Git first, then run this script again."
        exit 1
    fi
fi

# Create directory structure
echo "📂 Creating directory structure..."
mkdir -p docker-projects/web-application
mkdir -p jenkins-pipelines
mkdir -p git-workflows  
mkdir -p automation-scripts/deployment
mkdir -p kubernetes-configs
mkdir -p monitoring-configs
mkdir -p infrastructure-as-code
mkdir -p notes
mkdir -p learning-projects

# Create main README
echo "📝 Creating README.md..."
cat > README.md << 'EOL'
# DevOps Learning Repository - Sreenath92

Welcome to my DevOps learning journey! This repository contains hands-on projects, configurations, and documentation.

## 🎯 Learning Path
- **Phase 1**: Git & GitHub workflows ✅
- **Phase 2**: Docker containerization 🔄  
- **Phase 3**: Jenkins CI/CD pipelines 📋
- **Phase 4**: Kubernetes orchestration 📋
- **Phase 5**: Infrastructure as Code 📋

## 📁 Repository Structure

```
devops_learning_sree/
├── docker-projects/          # Docker applications and configs
├── jenkins-pipelines/        # CI/CD pipeline definitions
├── git-workflows/           # Git branching strategies
├── automation-scripts/      # Deployment and utility scripts
├── kubernetes-configs/      # K8s manifests and configs
├── monitoring-configs/      # Prometheus, Grafana setups
├── infrastructure-as-code/  # Terraform, Ansible configs
├── learning-projects/       # Complete end-to-end projects
└── notes/                  # Learning documentation
```

## 🛠️ Current Environment
- **OS**: Ubuntu Server on VMware
- **Version Control**: Git + GitHub (SSH)
- **Next Steps**: Docker installation and first container

## 🚀 Quick Start
1. Clone this repository
2. Follow the learning path in each directory
3. Practice with real projects and deployments

---
**Author**: Sreenath92  
**Started**: $(date +"%Y-%m-%d")
EOL

# Create Node.js web application
echo "🌐 Creating sample web application..."
cat > docker-projects/web-application/app.js << 'EOL'
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send(`
    <html>
    <head>
        <title>DevOps Learning App - Sreenath92</title>
        <style>
            body { 
                font-family: 'Segoe UI', Arial, sans-serif; 
                margin: 0; padding: 40px; 
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
            }
            .container { 
                max-width: 900px; margin: 0 auto; 
                background: rgba(255,255,255,0.1); 
                padding: 40px; border-radius: 15px; 
                backdrop-filter: blur(10px);
                box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
            }
            h1 { font-size: 2.5em; margin-bottom: 30px; text-align: center; }
            .info-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin: 30px 0; }
            .info-card { 
                background: rgba(255,255,255,0.1); 
                padding: 20px; border-radius: 10px;
                border: 1px solid rgba(255,255,255,0.2);
            }
            .status { color: #4ade80; font-weight: bold; font-size: 1.2em; }
            ul { list-style: none; padding: 0; }
            li { padding: 5px 0; }
            li:before { content: "✅ "; }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>🚀 DevOps Learning Application</h1>
            
            <div class="info-grid">
                <div class="info-card">
                    <h3>📋 Project Info</h3>
                    <p><strong>Developer:</strong> Sreenath92</p>
                    <p><strong>Environment:</strong> ${process.env.NODE_ENV || 'development'}</p>
                    <p><strong>Version:</strong> 1.0.0</p>
                    <p><strong>Container:</strong> Docker Ready</p>
                </div>
                
                <div class="info-card">
                    <h3>⏰ Runtime Info</h3>
                    <p><strong>Started:</strong> ${new Date().toLocaleString()}</p>
                    <p><strong>Uptime:</strong> ${Math.floor(process.uptime())} seconds</p>
                    <p class="status">🟢 Application Running</p>
                </div>
            </div>
            
            <div class="info-card">
                <h3>🎯 DevOps Skills Practiced</h3>
                <ul>
                    <li>Git version control and GitHub integration</li>
                    <li>Docker containerization and best practices</li>
                    <li>Node.js application development</li>
                    <li>Environment configuration management</li>
                    <li>Health monitoring and API endpoints</li>
                </ul>
            </div>
        </div>
    </body>
    </html>
  `);
});

app.get('/api/health', (req, res) => {
  res.json({ 
    status: 'healthy',
    service: 'devops-learning-app',
    timestamp: new Date().toISOString(),
    version: '1.0.0',
    environment: process.env.NODE_ENV || 'development',
    uptime: process.uptime()
  });
});

app.get('/api/info', (req, res) => {
  res.json({
    application: 'DevOps Learning Application',
    author: 'Sreenath92',
    version: '1.0.0',
    description: 'Sample application for practicing DevOps skills',
    technologies: ['Node.js', 'Express.js', 'Docker'],
    features: ['Health checks', 'Environment configs', 'Container ready'],
    endpoints: {
      home: '/',
      health: '/api/health', 
      info: '/api/info'
    }
  });
});

const server = app.listen(port, () => {
  console.log(`🌟 DevOps Learning App started successfully!`);
  console.log(`🔗 Application URL: http://localhost:${port}`);
  console.log(`❤️  Health Check: http://localhost:${port}/api/health`);
  console.log(`ℹ️  API Info: http://localhost:${port}/api/info`);
  console.log(`📝 Author: Sreenath92`);
});

// Graceful shutdown
process.on('SIGTERM', () => {
  console.log('🛑 Received SIGTERM, shutting down gracefully...');
  server.close(() => {
    console.log('✅ Process terminated');
  });
});
EOL

# Create package.json for the Node.js app
echo "📦 Creating package.json..."
cat > docker-projects/web-application/package.json << 'EOL'
{
  "name": "devops-learning-app-sreenath92",
  "version": "1.0.0",
  "description": "Sample web application for DevOps learning by Sreenath92",
  "main": "app.js",
  "scripts": {
    "start": "node app.js",
    "dev": "nodemon app.js",
    "test": "echo 'Tests will be implemented in CI/CD phase' && exit 0"
  },
  "keywords": ["devops", "docker", "nodejs", "learning", "sreenath92"],
  "author": "Sreenath92",
  "license": "MIT",
  "dependencies": {
    "express": "^4.18.2"
  },
  "devDependencies": {
    "nodemon": "^3.0.1"
  },
  "engines": {
    "node": ">=16.0.0"
  }
}
EOL

# Create optimized Dockerfile
echo "🐳 Creating Dockerfile..."
cat > docker-projects/web-application/Dockerfile << 'EOL'
# Multi-stage build for production optimization
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

# Dependencies stage
FROM base AS dependencies  
RUN npm ci --only=production && npm cache clean --force

# Development stage
FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

# Production stage
FROM node:18-alpine AS production

# Create non-root user for security
RUN addgroup -g 1001 -S nodejs && \
    adduser -S appuser -u 1001 -G nodejs

WORKDIR /app

# Copy dependencies from dependencies stage
COPY --from=dependencies /app/node_modules ./node_modules

# Copy application code with proper ownership
COPY --chown=appuser:nodejs . .

# Switch to non-root user
USER appuser

# Expose application port
EXPOSE 3000

# Add health check for container monitoring
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD node -e "require('http').get('http://localhost:3000/api/health', (res) => { process.exit(res.statusCode === 200 ? 0 : 1) }).on('error', () => process.exit(1))"

# Start the application
CMD ["npm", "start"]
EOL

# Create Docker Compose configuration
echo "🐙 Creating docker-compose.yml..."
cat > docker-projects/web-application/docker-compose.yml << 'EOL'
version: '3.8'

services:
  devops-learning-app:
    build: 
      context: .
      dockerfile: Dockerfile
      target: production
    container_name: devops-learning-app-sreenath92
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
      - PORT=3000
    restart: unless-stopped
    healthcheck:
      test: ["CMD-SHELL", "wget --no-verbose --tries=1 --spider http://localhost:3000/api/health || exit 1"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s
    networks:
      - devops-network
    labels:
      - "com.sreenath92.service=devops-learning"
      - "com.sreenath92.version=1.0.0"

networks:
  devops-network:
    driver: bridge
    labels:
      - "com.sreenath92.network=devops-learning"
EOL

# Create .dockerignore file
echo "🚫 Creating .dockerignore..."
cat > docker-projects/web-application/.dockerignore << 'EOL'
node_modules
npm-debug.log
.git
.gitignore
README.md
.env
.env.local
.env.development.local
.env.test.local
.env.production.local
coverage
.nyc_output
.cache
.parcel-cache
.DS_Store
*.log
EOL

# Create deployment script
echo "🚀 Creating deployment automation script..."
cat > automation-scripts/deployment/deploy.sh << 'EOL'
#!/bin/bash

# DevOps Learning - Smart Deployment Script
# Author: Sreenath92
# Usage: ./deploy.sh [environment] [version]

set -e

ENVIRONMENT=${1:-development}
VERSION=${2:-latest}
APP_NAME="devops-learning-app-sreenath92"
IMAGE_NAME="sreenath92/devops-learning-app"

echo "🚀 Starting deployment for DevOps Learning Application"
echo "👤 Author: Sreenath92"
echo "📍 Environment: $ENVIRONMENT"
echo "🏷️  Version: $VERSION"
echo "=================================================="

# Navigate to application directory
cd "$(dirname "$0")/../../docker-projects/web-application"

# Pre-deployment checks
echo "🔍 Running pre-deployment checks..."
if [ ! -f "package.json" ]; then
    echo "❌ package.json not found!"
    exit 1
fi

if [ ! -f "Dockerfile" ]; then
    echo "❌ Dockerfile not found!"
    exit 1
fi

echo "✅ Pre-deployment checks passed"

# Build the application
echo "🔨 Building Docker image..."
docker build -t $IMAGE_NAME:$VERSION -t $IMAGE_NAME:latest .

# Stop and remove existing container
echo "🛑 Stopping existing container (if running)..."
docker stop $APP_NAME 2>/dev/null || true
docker rm $APP_NAME 2>/dev/null || true

# Run new container
echo "▶️  Starting new container..."
docker run -d \
  --name $APP_NAME \
  -p 3000:3000 \
  -e NODE_ENV=$ENVIRONMENT \
  -e VERSION=$VERSION \
  --restart unless-stopped \
  --label "com.sreenath92.deployment=$(date +%s)" \
  $IMAGE_NAME:$VERSION

# Wait for application to start
echo "⏳ Waiting for application to start..."
sleep 15

# Health check
echo "🔍 Performing health check..."
HEALTH_CHECK=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/api/health || echo "000")

if [ "$HEALTH_CHECK" = "200" ]; then
    echo "✅ Deployment successful!"
    echo "🌐 Application is available at: http://localhost:3000"
    echo "❤️  Health check endpoint: http://localhost:3000/api/health"
    echo "ℹ️  API info endpoint: http://localhost:3000/api/info"
    
    # Display container info
    echo ""
    echo "📊 Container Information:"
    docker ps | grep $APP_NAME
    
else
    echo "❌ Health check failed! HTTP Status: $HEALTH_CHECK"
    echo "📋 Container logs:"
    docker logs $APP_NAME --tail 20
    exit 1
fi

echo ""
echo "🎉 Deployment completed successfully by Sreenath92!"
EOL

chmod +x automation-scripts/deployment/deploy.sh

# Create Git workflow documentation
echo "🌿 Creating Git workflow examples..."
cat > git-workflows/devops-git-strategies.md << 'EOL'
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
EOL

# Create learning notes
echo "📚 Creating learning documentation..."
cat > notes/devops-learning-journey.md << 'EOL'
# DevOps Learning Journey - Sreenath92

## Learning Objectives & Progress

### Phase 1: Foundation Setup ✅
- [x] Ubuntu Server VM setup with VMware
- [x] Git configuration and GitHub SSH authentication  
- [x] Repository structure and organization
- [x] Basic Linux command line proficiency

### Phase 2: Version Control Mastery ✅
- [x] Git branching strategies
- [x] GitHub workflow integration
- [x] Commit message conventions
- [x] Git hooks for automation

### Phase 3: Containerization with Docker 🔄
- [ ] Docker installation and basic commands
- [ ] Dockerfile creation and optimization
- [ ] Multi-stage builds for production
- [ ] Docker Compose for multi-service apps
- [ ] Container security best practices
- [ ] Docker registry usage

### Phase 4: CI/CD with Jenkins 📋
- [ ] Jenkins installation and configuration
- [ ] Pipeline as Code (Jenkinsfile)
- [ ] Automated build and test processes
- [ ] Deployment automation
- [ ] Integration with GitHub webhooks

### Phase 5: Container Orchestration 📋
- [ ] Kubernetes cluster setup
- [ ] Pod, Service, and Deployment configs
- [ ] Ingress and load balancing
- [ ] ConfigMaps and Secrets management

### Phase 6: Infrastructure as Code 📋
- [ ] Terraform for infrastructure provisioning
- [ ] Ansible for configuration management
- [ ] Cloud provider integration (AWS/Azure)

## Key Concepts Learned

### Git & Version Control
- **Branching Strategies**: Feature branch workflow, GitFlow
- **Collaboration**: Pull requests, code reviews, merge strategies
- **Automation**: Git hooks, automated testing on commits

### Docker Containerization  
- **Container Benefits**: Portability, consistency, isolation
- **Dockerfile Optimization**: Multi-stage builds, layer caching
- **Security**: Non-root users, minimal base images
- **Networking**: Container networking, port mapping

## Tools and Technologies

### Current Environment
- **OS**: Ubuntu Server 22.04 LTS
- **Virtualization**: VMware Workstation Pro
- **Version Control**: Git + GitHub with SSH
- **Editor**: Vi/Vim, Nano

### Tools to Master
- **Containerization**: Docker, Docker Compose
- **CI/CD**: Jenkins, GitHub Actions
- **Orchestration**: Kubernetes, Docker Swarm
- **IaC**: Terraform, Ansible
- **Monitoring**: Prometheus, Grafana
- **Cloud**: AWS, Azure, GCP

## Project Structure Philosophy

```
devops_learning_sree/
├── docker-projects/      # Hands-on container projects
├── jenkins-pipelines/    # CI/CD automation configs
├── git-workflows/        # Version control strategies
├── automation-scripts/   # Deployment and utility scripts
├── kubernetes-configs/   # Container orchestration
├── monitoring-configs/   # Observability and alerting
├── infrastructure-as-code/ # Infrastructure automation
├── learning-projects/    # End-to-end implementations
└── notes/               # Documentation and learnings
```

## Best Practices Learned

### Git Workflow
1. Always work on feature branches
2. Use descriptive commit messages
3. Pull request reviews before merging
4. Keep commits atomic and focused
5. Tag releases for versioning

### Docker Development
1. Use multi-stage builds for optimization
2. Run containers as non-root users
3. Keep images small and focused
4. Use .dockerignore to exclude unnecessary files
5. Implement health checks for monitoring

## Next Learning Goals

### Immediate (Next 2 weeks)
- [ ] Complete Docker installation and basic usage
- [ ] Build and run first containerized application
- [ ] Master Docker Compose for multi-service setups

### Short Term (Next month)
- [ ] Jenkins installation and first pipeline
- [ ] Automated deployment from Git to Docker
- [ ] Container registry integration

### Long Term (Next 3 months)
- [ ] Kubernetes cluster deployment
- [ ] Infrastructure as Code implementation
- [ ] Complete CI/CD pipeline with monitoring

## Learning Resources

### Documentation
- Official Docker documentation
- Git Pro book (free online)
- Jenkins handbook
- Kubernetes documentation

### Hands-on Practice
- Docker labs and exercises
- Jenkins pipeline examples
- Real-world project deployments
- Community best practices

---
**Learning Started**: $(date +"%Y-%m-%d")  
**Last Updated**: $(date +"%Y-%m-%d")  
**Author**: Sreenath92
EOL

# Create Jenkins pipeline template
echo "⚙️ Creating Jenkins pipeline template..."
cat > jenkins-pipelines/Jenkinsfile << 'EOL'
pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'sreenath92/devops-learning-app'
        DOCKER_TAG = "${BUILD_NUMBER}"
        APP_NAME = 'devops-learning-app-sreenath92'
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo '📥 Checking out source code...'
                git branch: 'main', 
                    url: 'https://github.com/Sreenath92/devops_learning_sree.git'
            }
        }
        
        stage('Build') {
            steps {
                echo '🔨 Building Docker image...'
                dir('docker-projects/web-application') {
                    script {
                        dockerImage = docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                        docker.build("${DOCKER_IMAGE}:latest")
                    }
                }
            }
        }
        
        stage('Test') {
            steps {
                echo '🧪 Running tests...'
                dir('docker-projects/web-application') {
                    sh '''
                        # Install dependencies and run tests
                        npm install
                        npm test
                        
                        # Docker image tests
                        docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} npm test
                    '''
                }
            }
        }
        
        stage('Security Scan') {
            steps {
                echo '🔒 Running security scans...'
                script {
                    // Scan Docker image for vulnerabilities
                    sh "docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }
        
        stage('Deploy to Staging') {
            steps {
                echo '🚀 Deploying to staging environment...'
                script {
                    sh """
                        # Stop existing container
                        docker stop ${APP_NAME}-staging || true
                        docker rm ${APP_NAME}-staging || true
                        
                        # Deploy new version
                        docker run -d \\
                            --name ${APP_NAME}-staging \\
                            -p 3001:3000 \\
                            -e NODE_ENV=staging \\
                            ${DOCKER_IMAGE}:${DOCKER_TAG}
                    """
                }
            }
        }
        
        stage('Health Check') {
            steps {
                echo '🔍 Performing health check...'
                script {
                    // Wait for application to start
                    sh 'sleep 30'
                    
                    // Health check
                    def healthCheck = sh(
                        script: 'curl -f http://localhost:3001/api/health',
                        returnStatus: true
                    )
                    
                    if (healthCheck != 0) {
                        error('Health check failed!')
                    }
                }
            }
        }
        
        stage('Deploy to Production') {
            when {
                branch 'main'
            }
            steps {
                echo '🌐 Deploying to production...'
                script {
                    sh './automation-scripts/deployment/deploy.sh production ${DOCKER_TAG}'
                }
            }
        }
    }
    
    post {
        success {
            echo '✅ Pipeline completed successfully!'
            // Send success notification
        }
        failure {
            echo '❌ Pipeline failed!'
            // Send failure notification
        }
        always {
            echo '🧹 Cleaning up...'
            // Clean up temporary resources
            sh '''
                docker system prune -f
                docker image prune -f
            '''
        }
    }
}
EOL

# Add all files and commit
echo "💾 Adding files to Git..."
git add .

# Create comprehensive commit message
git commit -m "🎉 Complete DevOps learning repository setup - Sreenath92

🏗️  Repository Structure:
- Complete directory organization for DevOps learning
- Docker projects with sample Node.js application  
- Jenkins pipeline templates and configurations
- Git workflow strategies and best practices
- Automation scripts for deployment
- Comprehensive learning documentation

🐳 Docker Features:
- Multi-stage Dockerfile with security best practices
- Docker Compose for easy container orchestration
- Health checks and monitoring endpoints
- Production-ready container configuration

🔄 CI/CD Ready:
- Jenkins pipeline with comprehensive stages
- Automated testing and security scanning
- Staging and production deployment automation
- Health check validation

📚 Documentation:
- Learning journey tracking and progress
- Git workflow strategies for DevOps
- Best practices and troubleshooting guides
- Resource links and next steps

🎯 Ready for next phase: Docker installation and hands-on practice

Author: Sreenath92
Environment: Ubuntu Server VM on VMware
Repository: devops_learning_sree"

# Push to repository
echo "📤 Pushing to GitHub..."
if git push origin main; then
    echo ""
    echo "🎉 SUCCESS! DevOps Learning Repository Setup Complete!"
    echo ""
    echo "✅ What's been created:"
    echo "   🏗️  Complete project structure"
    echo "   🐳 Docker-ready Node.js application with best practices"
    echo "   🔄 Jenkins CI/CD pipeline template"  
    echo "   📚 Comprehensive learning documentation"
    echo "   🚀 Deployment automation scripts"
    echo "   🌿 Git workflow strategies and examples"
    echo ""
    echo "🔗 Repository: https://github.com/Sreenath92/devops_learning_sree"
    echo ""
    echo "🚀 Next Steps:"
    echo "   1️⃣  Install Docker: curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh"
    echo "   2️⃣  Test the application: cd docker-projects/web-application && docker-compose up -d"  
    echo "   3️⃣  Access your app: http://localhost:3000"
    echo "   4️⃣  Check health: http://localhost:3000/api/health"
    echo ""
    echo "📁 Current directory contents:"
    ls -la
else
    echo ""
    echo "⚠️  Git push failed. This might be because:"
    echo "   1. The repository doesn't exist on GitHub yet"
    echo "   2. Network connectivity issues"
    echo ""  
    echo "📋 Manual steps to create repository:"
    echo "   1. Go to https://github.com/Sreenath92"
    echo "   2. Click 'New repository'"
    echo "   3. Name it: devops_learning_sree"
    echo "   4. Make it public"
    echo "   5. Don't initialize with README"
    echo "   6. Create repository"
    echo "   7. Run: git push origin main"
fi
