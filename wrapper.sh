#!/bin/bash
#
#

option="${1}"

compile_and_build(){
	if [ -e 'gradlew' -a -e 'build.gradle' ];
	then
		for cmd in 'compileJava' 'build';
		do
			./gradlew --no-daemon "${cmd}" --stacktrace --info
		done
	else
		printf "\033[35mWARNING: \033[31mNo Gradle Initial Files were found!\033[0m\n"
	fi
}

run_test(){
	_appname=$(cat settings.gradle | egrep rootProject.name | cut -d'=' -f2 | tr -d "'" | tr -d [:space:])
	# Test Package
	if [ -e "build/libs/${_appname}.jar" ];
	then
		java -cp build/libs/${_appname}.jar com.packtpub.ge.hello.Main Jenkins
	else
		printf "\033[35mError: \033[31mUnable to find ${_appname}.jar file\033[0m\n"
	fi
	return 0
}

help_menu(){
	printf "\033[36mPackage Wrapper\033[0m\n"
	printf "\033[32mCreate Package\t\033[35m[ -package, --package ]\033[0m\n"
	printf "\033[32mTest Package\t\033[35m[ -test, --test ]\033[0m\n"
}

case $option in
	-package|--package) compile_and_build;;
	-test|--test) run_test;;
	-h|-help|--help) help_menu;;
esac
