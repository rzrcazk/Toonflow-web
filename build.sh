#!/bin/bash
# ============================================================
# Build frontend and copy to toonflow-docker/data/web/
# ============================================================
# Usage: cd toonflow-web && ./build.sh
# ============================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DOCKER_WEB_DIR="$SCRIPT_DIR/../toonflow-docker/data/web"

echo "📦 Building frontend..."

# Patch build to skip vue-tsc (auto-import types are incomplete)
sed -i.bak 's/"build": "vue-tsc --build --force && vite build"/"build": "vite build"/' package.json
rm -f package.json.bak

# Remove deprecated tsconfig options
sed -i.bak '/"ignoreDeprecations"/d' tsconfig.app.json tsconfig.node.json 2>/dev/null || true
rm -f tsconfig.app.json.bak tsconfig.node.json.bak

yarn build

echo ""
echo "📋 Copying dist to toonflow-docker/data/web/..."

# Clean old dist
rm -rf "$DOCKER_WEB_DIR"
cp -r dist "$DOCKER_WEB_DIR"

echo ""
echo "✅ Frontend build complete!"
echo "   Restart container to apply: cd ../toonflow-docker && ./start.sh"
