# Complete-CI-CD-with-Terraform-and-AWS

Steps for completion 
1. write the sample application "app.js" once written, save and install all the necessary components throug the commadn line
   a. npm init -y
   b. npm i express

Now you can check that the app is running by digiting node app.js and then navigating to localhost:8080 on internet if a pagve showing Server is up and running shows up, then all is done correctly

2. Create the dockerfile 

3. Create secret on github repositoiries, this include AWS ACCESS KEY, Secret key (you can do that through AWS Console, do not use Root account, but IAM User), AWS S3 Bucket name and a private AWS_SSH_PRIVATE_KEY, you can create one on shell or cmd just by prompting ssh-keygen, then you can chose a name for a file that stores it and just use cat name to retrieve the  key 
