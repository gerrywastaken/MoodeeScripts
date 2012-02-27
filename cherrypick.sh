#!/bin/bash
versionTypes=(pro)
versions=(22 21 20 19)
branchStem=$1
cherry=$2
for versionType in "${versionTypes[@]}"; do
	for version in "${versions[@]}"; do
		if [ "$versionType" = "int" ]; then
			fullTypeName="r_int"
		else
			fullTypeName="r_pro"
		fi
		
		if [ "$version" = "m" ]; then
			fullVersionName="master"
		else
			fullVersionName="MOODLE_${version}_STABLE"
		fi

		echo "cd ~/src/moodle/$versionType/$version"
		cd ~/src/moodle/$versionType/$version
		echo "git stash"
		git stash
		echo "git checkout $fullTypeName/$fullVersionName"
		git checkout $fullTypeName/$fullVersionName
		echo "git reset HEAD --hard"
		git reset HEAD --hard
		echo "git branch -D ${version}_${branchStem}"
		git branch -D ${version}_${branchStem}
		echo "git checkout -b ${version}_${branchStem} $fullTypeName/$fullVersionName"
		git checkout -b ${version}_${branchStem} $fullTypeName/$fullVersionName
                echo "git cherry-pick $cherry"
                git cherry-pick $cherry
	done
done
