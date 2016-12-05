$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'profitwell'
require 'dotenv'
require 'vcr'
require 'support/vcr_setup.rb'
Dotenv.load(".env.local")
