#!/bin/bash
#
#

option="${1}"

error(){
	printf "\033[35mError:\t\033[31m${1}!\033[0m\n"
}

clean_all(){
	for _file in 'gradlew' 'build.gradle' 'settings.gradle' 'gradlew.bat'
	do
		if [ -f "$(find -type f -name ${_file})" ];
		then
			rm -rfv "${_file}"
		fi
	done

	for _dir in "$(find -type d -name gradle)";
	do
		rm -rfv ${_dir}
	done

	[ -f '.gradle_auto' ] && rm -fv '.gradle_auto'
}

init_gradle(){
	gradle --no-daemon init --stacktrace --info
	# gradle --no-daemon wrapper
	./gradlew --no-daemon wrapper --gradle-version 4.0 --stacktrace --info
	if [ -f 'build.gradle' -a ! -f '.gradle_auto' ];
	then
		date '+%s' > .gradle_auto
	else
		error "Gradle file 'build.gradle' is already appended"
	fi
}

reinit(){
	clean_all
	init_gradle
}

clean(){
	if [ -f './gradlew' ];
	then
		./gradlew --no-daemon clean
	elif [ -d "build" ];
	then
		rm -rfv 'build'
	else
		printf 'No files were found for cleaning\n'
	fi
}

help_menu(){
	printf "\033[36mGradle Commander\033[0m\n"
	printf "\033[35mInitiate Gradle\t\033[32m[ -i, -init, --init ]\033[0m\n"
	printf "\033[35mClean Build\t\033[32m[ -clean, --clean ]\033[0m\n"
	printf "\033[35mClean All\t\033[32m[ -rm, -remove, --remove ]\033[0m\n"
	printf "\033[35mReinit All\t\033[32m[ -ri, -reinit, --reinit ]\033[0m\n"
	printf "\033[35mHelp Menu\t\033[32m[ -h, -help, --help ]\033[0m\n"
}

case $option in
	-i|-init|--init) init_gradle;;
	-rm|-remove|--remove) clean_all;;
	-ri|-reinit|--reinit) reinit;;
	-clean|--clean) clean;;
	-h|-help|--help) help_menu;;
	*) error "Missing or invalid parameter was given";;
esac
