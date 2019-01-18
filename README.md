Rails API for the picture message app. A user is able to sign up, sign in and send webcam pictures to other users on app.

# Technology
Ruby on Rails
Heroku
Github
CarrierWave
CarrierWave-aws

# For database relationships
https://medium.com/@jbmilgrom/active-record-many-to-many-self-join-table-e0992c27c1e
Created message scaffold, belongs to user
Updated message scaffold
Add sender_id as a reference (manually in migration)
Add receiver_id as a reference (manually in migration)
Add ‘Seen’ column as a boolean
Add Picture_id as a reference
Updated users, picture and message models
Tested the relationship works in psql
Created a message.create and picture.create and sent it to User.first from User.first


# For image upload in Rails using Carrierwave
https://code.tutsplus.com/tutorials/rails-image-upload-using-carrierwave-in-a-rails-app--cms-25183
Added Carrierwave gemfile
Created new scaffold ‘Picture’ has_many: messages, ImageUploader
Created Image_uploader.rb

# To store in Amazon S3 (3 options)
carrierwave-aws
https://github.com/sorentwo/carrierwave-aws
In uploader, switched storage to :aws
Installed gem 'carrierwave-aws'
Added bin/initializers/carrierwave.rb
In .env, changed S3_BUCKET to S3_BUCKET_NAME
In .env, added AWS_REGIONOn front end, use formData (event.target) -> for click pic
Added custom options for AWS url in uploader/image_uploader.rb
Adding s3:PutObjectAcl permission in AWS
https://console.aws.amazon.com/iam/home?region=us-east-1#/policies$new?step=edit
Checked in localhost
Refreshed rakshyak bucket

# To get list of all users
Deleted initializers/aws.rb
Set up GET users route
Allow get users  before authentication

# Send a message
Messages_controller.rb
Added picture_id, receiver_id and sender.id in message_params
Made this a protected controller

# Heroku Deployment
https://git.generalassemb.ly/ga-wdi-boston/rails-heroku-setup-guide
https://stackoverflow.com/questions/32677478/rails-missing-region-error-aws-heroku-paperclip
