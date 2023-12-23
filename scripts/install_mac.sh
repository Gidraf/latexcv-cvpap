#!/usr/bin/env bash

set -e

function print () {
    echo "[latexcv]: $1"
}

PROJECT_DIR=$(pwd)

print "Download TexLive"
cd /tmp && curl -O http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

print "Unpack texlive"
tar -xvzf install-tl-unx.tar.gz
rm install-tl-unx.tar.gz

print "Prepare texlive installation in $PROJECT_DIR:"
cd install-tl-*/ || exit 1
chmod +x install-tl

print "Install texlive from profile: texlive.profile"
sudo ./install-tl --profile="$PROJECT_DIR/texlive.profile"

print "Expand PATH"
YEAR=$(date +'%Y')
PATH=/usr/local/texlive/${YEAR}/bin/x86_64-darwin:$PATH

print "Check for latex version:"
pdflatex -v

print "Install additional packages:"
sudo tlmgr install xifthen
#sudo tlmgr install ifmtarg
#sudo tlmgr install gillius
#sudo tlmgr install xkeyval
#sudo tlmgr install fontaxes
#sudo tlmgr install moresize
#sudo tlmgr install fontawesome
#sudo tlmgr install multirow
#sudo tlmgr install wrapfig
#sudo tlmgr install float
#sudo tlmgr install pgf
#sudo tlmgr install transparent
# cd "${PROJECT_DIR}"
