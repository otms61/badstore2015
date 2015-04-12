# coding: utf-8

require 'rubygems'
require 'awesome_print'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'active_record'
require 'active_support/core_ext'
require 'yaml'
require 'open-uri'
require 'open3'
require 'pry'

dbconfig = YAML.load(File.open('database.yml'))
ActiveRecord::Base.establish_connection(dbconfig['development'])

Capybara.default_wait_time = 30

Capybara.default_driver = :selenium
Capybara.app_host = 'http://localhost:5000'

RSpec.configure do |config|
  config.include Capybara::DSL
end

def path_join(path)
  URI.join(Capybara.app_host,path).to_s
end
