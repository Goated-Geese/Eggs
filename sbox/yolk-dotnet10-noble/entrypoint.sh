#!/bin/bash
# Pelican / Wings: substitute {{VAR}} from STARTUP with environment variables, then execute.
# Pattern from https://pelican.dev/docs/eggs/creating-a-custom-yolk

cd /home/container || exit 1

dotnet --version

# Same substitution pattern as Pelican custom-yolk docs
MODIFIED_STARTUP=$(eval echo "$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')")
echo ":/home/container$ ${MODIFIED_STARTUP}"

${MODIFIED_STARTUP}
