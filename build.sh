#!/bin/bash

# Build script for Cloudflare Pages
echo "Starting build process..."

# Check if protobuf is available
if command -v protoc &> /dev/null; then
    echo "Protobuf found, generating TypeScript files..."
    npm run proto:generate
else
    echo "Protobuf not found, skipping proto generation..."
    # Create empty proto files to prevent build errors
    mkdir -p ui/core/proto
    touch ui/core/proto/api.ts
    touch ui/core/proto/common.ts
    touch ui/core/proto/ui.ts
    touch ui/core/proto/apl.ts
    touch ui/core/proto/druid.ts
    touch ui/core/proto/hunter.ts
    touch ui/core/proto/mage.ts
    touch ui/core/proto/paladin.ts
    touch ui/core/proto/priest.ts
    touch ui/core/proto/rogue.ts
    touch ui/core/proto/shaman.ts
    touch ui/core/proto/warlock.ts
    touch ui/core/proto/warrior.ts
fi

# Build the Vite application
echo "Building Vite application..."
npx vite build

echo "Build complete!" 