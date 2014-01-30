# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Models::Application.config.secret_key_base = '7feaab1a15ea426d91924827ab4e1085772c2737816f366b16a5af1fe1e4a6c52a3a81a752cf846e1172e63a0c34e5f631b5f835b265adc2451d637ed8e3b16a'
