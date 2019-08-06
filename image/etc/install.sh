#!/bin/bash

echo 'Patching noVNC project...'
echo "use prefix path for frontend to backend communication: '$PREFIX_PATH'..."
sed -i "s|/app|$PREFIX_PATH|g" /src/web/static/novnc/app/ui.js
echo 'noVNC projcect patched.'

echo 'Building Node.js project...'
cd /src/web \
    && yarn \
    && npm run build

cp -R /src/web/dist/. /usr/local/lib/web/frontend/
echo 'Build finished.'