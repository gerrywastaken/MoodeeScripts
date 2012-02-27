#!/bin/bash
branchName=$1
branchVersion=$2

if [ "$branchVersion" = "m" ]; then
	fullVersionName="master"
else
	fullVersionName="MOODLE_${branchVersion}_STABLE"
fi

echo "cd ../$branchVersion"
echo "git checkout -B ${branchVersion}_${branchName} gerry/${branchVersion}_${branchName}"
echo "git log -n2"
echo "git rebase r_pro/${fullVersionName}"
echo "git log -n2"
echo "git push gerry -f"
