ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

ENV['facebook_api_key'] = '658594684315966'
ENV['facebook_api_secret'] = 'bf467e10f38ca07b9da838e1043cf2aa'
ENV['facebook_callback_url'] = 'http://192.168.6.128:3000/users/auth/facebook/callback'

ENV['google_callback_url'] = 'http://192.168.6.128:3000/users/auth/google/callback'

require 'bundler/setup' # Set up gems listed in the Gemfile.
