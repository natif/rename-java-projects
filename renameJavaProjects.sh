#!/bin/bash

CURRENT_PROJECT_NAME=''
CURRENT_PROJECT_PATH=''
NEW_PROJECT_GROUP_ID=''
NEW_PROJECT_NAME=''

gather_project_information() {
	echo "Please put down the path to current project's name on your PC, followed by [ENTER]:"
	read CURRENT_PROJECT_NAME

	echo "Please put down the path to current project's folder on your PC, followed by [ENTER]:"
	read CURRENT_PROJECT_PATH

	echo "Please put down project's groupId, followed by [ENTER]:"
	read NEW_PROJECT_GROUP_ID

	echo "Please put down the name(artifactId) of the project, followed by [ENTER]:"
	read NEW_PROJECT_NAME

	echo "Current project's name $CURRENT_PROJECT_NAME"

	echo "Current project's path $CURRENT_PROJECT_PATH"

	echo "Chosen project's groupId $NEW_PROJECT_GROUP_ID"

	echo "Chosen project's name(artifactId) $NEW_PROJECT_NAME"
}

rename_folder() { 
	mv $CURRENT_PROJECT_PATH/$CURRENT_PROJECT_NAME $CURRENT_PROJECT_PATH/$NEW_PROJECT_NAME
}

# rename_pom_details() {


# }

# rename_packages_folders() {

# }


gather_project_information

rename_folder