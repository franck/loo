# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_loo_session',
  :secret      => '5ffc1dae0fffab0951ecbdda084452037dc765f27411cb172f1677b34840576c80fb3cc2ac8681e05af61fda27ea236bee2578e795df43fa42f718867af0fd25'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
