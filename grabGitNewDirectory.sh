#!/bin/bash
sudo read;
wget "http://git.kernel.org/?p=git/git.git;a=blob_plain;f=contrib/workdir/git-new-workdir;hb=HEAD" -O - | sudo tee /usr/local/bin/git-new-workdir
sudo chmod u+x /usr/local/bin/git-new-workdir
