#!/bin/bash

# git clone https://gitlab.com/pedropombeiro/walkingpad-control.git into $CONTROL_DIR
# python3 -m pipenv install -r requirements.txt

SYSTEM_PYTHON="/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/Current/bin/python3"
ADDRESS="6CBC72AA-342A-A9E2-037C-C93813F2E1A3"

cd "$HOME/src/walkingpad/walkingpad-control"
$SYSTEM_PYTHON -m pipenv run ./walkingpad-control.py -a $ADDRESS --debug mode manual
sleep 2
$SYSTEM_PYTHON -m pipenv run ./walkingpad-control.py -a $ADDRESS --debug toggle-start


# cd "$HOME/src/walkingpad/walkingpad-control" && /Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/Current/bin/python3 -m pipenv run ./walkingpad-control.py -a 6CBC72AA-342A-A9E2-037C-C93813F2E1A3 --debug set --speed 60
