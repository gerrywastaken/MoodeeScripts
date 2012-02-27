#!/bin/bash
versionTypes=(int pro)
versions=(m 22 21 20 19)
for versionType in "${versionTypes[@]}"; do
	for version in "${versions[@]}"; do
		if [ "$version" = "m" ]; then
			fullVersionName="master"
		else
			fullVersionName="MOODLE_${version}_STABLE"
		fi

		cd ~/src/moodle/
		sh ~/src/git-new-workdir/git-new-workdir .seed $versionType/$version r_$versionType/$fullVersionName
	done
done
