nuclear-motors
==============

Nuclear Motors is a web store made by a group of students for a class. Guaranteed not to explode... maybe... sometimes... 78% chance...

Getting Started
===============
First in order to edit this repository you will need to make GitHub accounts.
After telling me your usernames I will then add you as collaborators.

In order to upload files you will need to do the following:

1. Download the Windows GitHub client
2. Follow the setup process
3. Create a local repository with the same name (neclear-motors) or create a clone
4. In options choose the default shell you prefer (I chose Git Bash; PowerShell didn't work properly)
5. Open the repository in Git Shell
6. Issue commands:
  1. git push
  2. git add 'files' (make sure files are in the local repository)
  3. git commit -m "My commit message"
7. Congratulations you are now even more integrated with the programming subculture!

P.S. In order to get the project template to work download and install Microsoft Server 2012 Developer Edition.<br>
P.P.S Also in order to get the project to connect to MS Server, you will need your instance name of your local SQL Server.
ex. JG-PC\JSQL

You will also need to add a user for the website to log into the db with: <br>
In SQL Server Management Studio: <br>
 1. Expand current server<br>
 2. Expand "Security"<br>
 3. Right click "Logins", select "New Login..." <br>
 4. Choose "SQL Server Authentication" - enter a username and password<br>
 5. Click "OK" to create the user<br>
