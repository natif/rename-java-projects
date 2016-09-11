#!/bin/bash

PROJECT_PATH=''
PROJECT_GROUP_ID=''
PROJECT_NAME=''

gather_project_information() {
	echo "Please put down the path to current project's folder on your PC, followed by [ENTER]:"
	read PROJECT_PATH

	echo "Please put down project's groupId, followed by [ENTER]:"
	read PROJECT_GROUP_ID

	echo "Please put down the name(artifactId) of the project, followed by [ENTER]:"
	read PROJECT_NAME


	echo "Current project's PATH $PROJECT_PATH"

	echo "Chosen project's groupId $PROJECT_GROUP_ID"

	echo "Chosen project's name(artifactId) $PROJECT_NAME"
}

rename_folder() { 
 	echo "$PROJECT_PATH"

	echo "$PROJECT_GROUP_ID"

	echo "$PROJECT_NAME"
}

rename_pom_details() {
	echo "$PROJECT_PATH"

	echo "$PROJECT_GROUP_ID"

	echo "$PROJECT_NAME"

}

rename_packages_folders() {
	echo "$PROJECT_PATH"

	echo "$PROJECT_GROUP_ID"

	echo "$PROJECT_NAME"
}


gather_project_information
rename_folder