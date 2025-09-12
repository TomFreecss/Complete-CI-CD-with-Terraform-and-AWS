# Complete-CI-CD-with-Terraform-and-AWS

Steps for completion 
1. write the sample application "app.js" once written, save and install all the necessary components throug the commadn line
   a. npm init -y
   b. npm i express

Now you can check that the app is running by digiting node app.js and then navigating to localhost:8080 on internet if a pagve showing Server is up and running shows up, then all is done correctly

2. Create the dockerfile 

3. Create secret on github repositoiries, this include AWS ACCESS KEY, Secret key (you can do that through AWS Console, do not use Root account, but IAM User), AWS S3 Bucket name and a private AWS_SSH_PRIVATE_KEY, you can create one on shell or cmd just by prompting ssh-keygen, then you can chose a name for a file that stores it and just use cat name to retrieve the  key. Be sure to refer to the right names because AWS use specific names for its secrets references. in this file the names are correct
env:
  AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
  AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
  AWS_TF_STATE_BUCKET_NAME: ${{ secrets.AWS_TF_STATE_BUCKET_NAME }}
  AWS_SSH_PRIVATE_KEY: ${{ secrets.AWS_SSH_PRIVATE_KEY }}
  PUBLIC_KEY: ${{ secrets.PUBLIC_KEY }}
  AWS_REGION: us-east-1

the name must stay the same Left to the : 

also AWS region should always match the regio nyou are working in

4. Create a terraform folder in which you will write the 2 terraform files, in order for them to work you need to be very specific with AMIs, especially you need to check if the instance type and the AMI ID that you are looking for exists in your region
   a. in the branch "ci-cd-ami-dinamica" there is an optional wat in the main tf that configures the ami in a dynamic way, so         that you doln't have top worry for type and region
5. create the folder .github/worflows and then write into it the deploy.yml
6. Now yo uare ready to push the files into your branch and you may go on actions to check if everything if the workflow is behaving correctly
