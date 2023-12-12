#!/bin/bash

# git clone https://gitlab.com/pedropombeiro/walkingpad-control.git into $CONTROL_DIR
# python3 -m pipenv install -r requirements.txt

ADDRESS="6CBC72AA-342A-A9E2-037C-C93813F2E1A3"
CONTROL_DIR="$HOME/src/walkingpad/walkingpad-control"

cd "$CONTROL_DIR"
python3 -m pipenv run ./walkingpad-control.py -a $ADDRESS --debug toggle-start
