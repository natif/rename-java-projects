#!/bin/bash

CURRENT_PROJECT_NAME=''
CURRENT_PROJECT_PATH=''
NEW_PROJECT_GROUP_ID=''
NEW_PROJECT_NAME=''

gather_project_information() {
	echo "Please put down current project's name on your PC, followed by [ENTER]:"
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

rename_pom_details() {
	sed -i '/<dependencies>/,/<\/dependencies>/d' $CURRENT_PROJECT_PATH/$NEW_PROJECT_NAME/pom.xml
	sed -i 's/\(<groupId>\).*\(<\/groupId>\)/\1'"$NEW_PROJECT_GROUP_ID"'\2/g' $CURRENT_PROJECT_PATH/$NEW_PROJECT_NAME/pom.xml
	sed -i 's/\(<artifactId>\).*\(<\/artifactId>\)/\1'"$NEW_PROJECT_NAME"'\2/g' $CURRENT_PROJECT_PATH/$NEW_PROJECT_NAME/pom.xml
	sed -i 's/\(<name>\).*\(<\/name>\)/\1'"$NEW_PROJECT_NAME"'\2/g' $CURRENT_PROJECT_PATH/$NEW_PROJECT_NAME/pom.xml
}

remove_packages_related_files() {
	rm -fr $CURRENT_PROJECT_PATH/$NEW_PROJECT_NAME/src/main/java/*
	rm -fr $CURRENT_PROJECT_PATH/$NEW_PROJECT_NAME/src/test/java/*
}

delete_useless_files() {
	rm -fr $CURRENT_PROJECT_PATH/$NEW_PROJECT_NAME/target
	rm -fr $CURRENT_PROJECT_PATH/$NEW_PROJECT_NAME/.idea
	rm -fr $CURRENT_PROJECT_PATH/$NEW_PROJECT_NAME/.git
	rm -fr $CURRENT_PROJECT_PATH/$NEW_PROJECT_NAME/README.md
	find "$CURRENT_PROJECT_PATH/$NEW_PROJECT_NAME" -type f -name "*.iml" -exec rm -f {} \;

}


gather_project_information
rename_folder
remove_packages_related_files
delete_useless_files
rename_pom_details
