# Be sure to restart your server when you modify this file.

Mymind::Application.config.session_store :cookie_store

Mymind::Application.config.session = {
  :key          => '_exmem_session',     # name of cookie that stores the data
  :expire_after => 1.month, # expire cookie
  :secure       => false,   # fore https if true
  :httponly     => true # a measure against XSS attacks, prevent client side scripts from accessing the cookie
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Mymind::Application.config.session_store :active_record_store
