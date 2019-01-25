A Rails backend app for sending a picgram using React frontend. The frontend repo can be found at https://github.com/RakshyaKC/picture-message-client . A user is able to sign up, sign in and send webcam pictures to other users on app. The app can be found at https://rakshyakc.github.io/picture-message-client/#/

# Technology used
Ruby on Rails
Heroku
Github
CarrierWave
CarrierWave-aws

# Entity relationship diagram
https://docs.google.com/drawings/d/1VACfnEU23khM0Z7ZF7TfGq-0h-Y8rkbUwP-yPMuIVHw/edit?usp=sharing
* Created message scaffold, belongs to user
* Updated message scaffold
* Add sender_id as a reference (manually in migration)
* Add receiver_id as a reference (manually in migration)
* Add ‘Seen’ column as a boolean
* Add Picture_id as a reference
* Updated users, picture and message models
* Tested the relationship works in psql
* Created a message.create and picture.create and sent it to User.first from User.first


# For image upload in Rails using Carrierwave
https://code.tutsplus.com/tutorials/rails-image-upload-using-carrierwave-in-a-rails-app--cms-25183
* Added Carrierwave gemfile using above resource
* Created new scaffold ‘Picture’ has_many: messages, ImageUploader
* Created Image_uploader.rb

# To store in Amazon S3
Carrierwave-aws (follow instructions on https://github.com/sorentwo/carrierwave-aws)
* In uploader, switched storage to :aws
* Installed gem 'carrierwave-aws'
* Added bin/initializers/carrierwave.rb
* In .env, changed S3_BUCKET to S3_BUCKET_NAME
* In .env, added AWS_REGIONOn front end, use formData (event.target) -> for click pic
* Added custom options for AWS url in uploader/image_uploader.rb
* Adding s3:PutObjectAcl permission in AWS
https://console.aws.amazon.com/iam/home?region=us-east-1#/policies
* Checked in localhost
* Refreshed bucket

# To get list of all users
* Deleted initializers/aws.rb
* Set up GET users route
* Allow get users  before authentication

# Send a message
* Messages_controller.rb
* Added picture_id, receiver_id and sender.id in message_params
* Made this a protected controller

# Routes expected by API
* /sign-up (create)
* /sign-in (post)
* /sign-out (delete)
* /change-password (update)
* /create-pic-message (create)
* /inbox (get and update)
* /examples (get)
* /users (get)

# Future issues to be solved
* Make the app more secure
* Ensure threading of conversations
* Enable users to have profile pictures
* Use websocket or action cable instead of making api calls frequently.


# Heroku Deployment
https://git.generalassemb.ly/ga-wdi-boston/rails-heroku-setup-guide
https://stackoverflow.com/questions/32677478/rails-missing-region-error-aws-heroku-paperclip
