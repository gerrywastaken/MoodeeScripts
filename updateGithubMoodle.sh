#!/bin/bash
versionTypes=(pro)
versions=(m 22 21 20 19)
remote=$1
for versionType in "${versionTypes[@]}"; do
	echo "git fetch r_$versionType"
	#git fetch r_$versionType
	for version in "${versions[@]}"; do
		if [ "$version" = "m" ]; then
			fullVersionName="master"
		else
			fullVersionName="MOODLE_${version}_STABLE"
		fi

		echo "git push -f $remote r_$versionType/$fullVersionName:$fullVersionName"
		git push -f $remote r_$versionType/$fullVersionName:$fullVersionName
	done
done

