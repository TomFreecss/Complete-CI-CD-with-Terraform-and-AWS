# Complete-CI-CD-with-Terraform-and-AWS

Steps for completion 
1. write the sample application "app.js" once written, save and install all the necessary components throug the commadn line
   a. npm init -y
   b. npm i express

Now you can check that the app is running by digiting node app.js and then navigating to localhost:8080 on internet if a pagve showing Server is up and running shows up, then all is done correctly

2. Create the dockerfile 

3. Create secret on github repositoiries, this include AWS ACCESS KEY, Secret key (you can do that through AWS Console, do not use Root account, but IAM User), AWS S3 Bucket name and a private AWS_SSH_PRIVATE_KEY, you can create one on shell or cmd just by prompting ssh-keygen, then you can chose a name for a file that stores it and just use cat name to retrieve the  key. Be sure to refer to the right names because AWS use specific names for its secrets references. in this file the names are correct
env:
  AWS_ACCESS_KEY_ID: ${{ secrets.ACCESS_KEY_ID }}
  AWS_SECRET_ACCESS_KEY: ${{ secrets.SECRET_ACCESS_KEY }}
  AWS_TF_STATE_BUCKET_NAME: ${{ secrets.AWS_TF_STATE_BUCKET_NAME }}
  PRIVATE_SSH_KEY: ${{ secrets.AWS_SSH_KEY_PRIVATE }}
  PUBLIC_SSH_KEY: ${{ secrets.AWS_SSH_KEY_PUBLIC }}
  AWS_REGION: eu-north-1

the name must stay the same Left to the : 

also AWS region should always match the region  you are working in, clearly it's not always going to be eu-north-1

4. Create a terraform folder in which you will write the 2 terraform files, in order for them to work you need to be very specific with AMIs, especially you need to check if the instance type and the AMI ID that you are looking for exists in your region
   a. in the branch "ci-cd-ami-dinamica" there is a change in the main tf that configures the ami in a dynamic way, so that you doln't have to worry for type and region
5. create the folder .github/worflows and then write into it the deploy.yml
6. Now yo uare ready to push the files into your branch and you may go on actions to check if everything if the workflow is behaving correctly

PS node > 16.9 is needed to connect because of (Object.hasOwn) otherwise myappcontainer won't connect your EC2 instance and copy pasting the public IP will result in failed connection

PSS: I cleared the main branch of all the commits for clarity, an easy way to do so is this
$ # Make sure you’re on the main branch
git checkout main

# Create a temporary branch (just in case)
git branch backup-main

# Create a new orphan branch (no history)
git checkout --orphan latest-main

# Add all files to the new branch
git add -A

# Commit them
git commit -m "Initial commit with current files"

# Delete the old branch
git branch -D main

# Rename the new branch to main
git push -f origin mainte the remote history
