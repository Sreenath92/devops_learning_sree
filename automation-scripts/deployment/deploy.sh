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
