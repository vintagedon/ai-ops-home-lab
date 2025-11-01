#!/bin/bash
# minimal-setup.sh - Just get Neo4j working, period.

set -e

echo "🚀 Setting up Neo4j - MINIMAL VERSION"

# Stop any running instance
docker compose down 2>/dev/null || true

# Create basic directories
mkdir -p data logs plugins import

# Remove any config files that might be causing issues
rm -rf config/

# Set permissions
chmod 755 data logs plugins import

echo "🐳 Starting Neo4j..."
docker compose up -d

echo "⏳ Waiting 30 seconds for startup..."
sleep 30

# Check if it's running
if curl -s http://localhost:7474 > /dev/null; then
    echo "✅ SUCCESS! Neo4j is running"
    echo ""
    echo "📊 Access: http://localhost:7474" 
    echo "🔐 Login: neo4j / your_secure_password"
    echo ""
    echo "💾 Memory allocation:"
    echo "   • Heap: 4G-8G"
    echo "   • Page Cache: 12G"
    echo ""
else
    echo "❌ Still not working. Let's check what's wrong:"
    echo ""
    docker-compose logs neo4j
fi