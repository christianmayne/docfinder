# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_docfind_session',
  :secret      => 'd17281f71e32b34990298905a225891d0e8d5f88863434bf92b6805b7fa5fa9a4339a34b1394653ebc262b52d0160cb733dfc2daa7e92e8f226e4bfc901b4b5f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
