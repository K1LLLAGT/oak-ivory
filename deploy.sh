#!/bin/bash

echo "🐳 Building Docker image..."
docker build -t gwthardwoodfloors .

echo "🚀 Running container..."
docker run -d --name gwthardwoodfloors -p 80:80 gwthardwoodfloors

echo "📡 Starting contact form backend..."
cd backend
node server.js &
cd ..

echo "✅ Deployment complete. Site live on port 80."
