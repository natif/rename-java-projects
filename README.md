A simple script to help me create a copy of the maven project and cleanup unnecessary content.

How it works:
- User inputs data related (name, path) to project that it will make copy of.
- User inputs data related to new project (groupId, artifactId).
- Script creates a new project in its running location.
- Script removes useless data that was related to previous project (git folder, IntelliJ related files, target).
- Script modifies pom.xml file - changes groupId, artifactId and name tags with the data that user typed. Also removes dependencies tag.

