#!/bin/bash

set -euo pipefail

brew bundle --file ../macos/base.Brewfile

brew services start languagetool
