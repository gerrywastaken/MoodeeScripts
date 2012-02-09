#!/bin/bash
versionTypes=(pro)
versions=(m 22 21 20 19)
branchSuffix=$1
for versionType in "${versionTypes[@]}"; do
	for version in "${versions[@]}"; do
		if [ "$versionType" = "int" ]; then
			fullTypeName="integration"
		else
			fullTypeName="moodle"
		fi

		
		if [ "$version" = "m" ]; then
			fullVersionName="master"
		else
			fullVersionName="MOODLE_${version}_STABLE"
		fi

		cd ~/src/moodle/$versionType/$version
		git checkout -b ${version}_${branchSuffix} r_$versionType/$fullVersionName 
	done
done

