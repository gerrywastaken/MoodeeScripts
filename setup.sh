#!/bin/bash
versionTypes=(int pro)
versions=(m 22 21 20 19)
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

		cd .seed
		git branch -D $fullTypeName/$fullVersionName
		rm -fr $versionType/$version
		cd ..
		git-new-workdir .seed $versionType/$version $fullTypeName/$fullVersionName
	done
done

