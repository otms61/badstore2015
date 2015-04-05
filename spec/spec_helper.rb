require 'rubygems'
require 'awesome_print'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'active_record'
require 'active_support/core_ext'
require 'yaml'
require 'open-uri'

dbconfig = YAML.load(File.open('database.yml'))
ActiveRecord::Base.establish_connection(dbconfig['development'])

Capybara.default_wait_time = 30

Capybara.default_driver = :selenium

RSpec.configure do |config|
  config.include Capybara::DSL
end
