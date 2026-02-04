#!/bin/bash

VSS_VERSION="v6.0"

echo "VSS version: $VSS_VERSION"

echo "Setting up virtual environment..."
# creates a virtual environment if it does not exist and activates it
VENV_DIR="$(dirname "$0")/venv"
if [ ! -d "$VENV_DIR" ]; then
    python3 -m venv "$VENV_DIR"
fi
source "$VENV_DIR/bin/activate"

echo "Installing required packages..."
# installs the required packages
pip install --upgrade pip
pip install vss-tools

echo "VSS setup completed. Virtual environment is activated."
echo "Generate your custom VSS using 'vss-tools' commands."

vspec export json --vspec spec/VehicleSignalSpecification.vspec \
    --overlays overlays/custom_overlay.vspec --output output/VSS-spec.json --pretty --extend-all-attributes