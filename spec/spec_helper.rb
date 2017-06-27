require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }  

  ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)
  
  RSpec.configure do |config|

    config.infer_base_class_for_anonymous_controllers = false
  
    config.order = "random"
  end
end

Spork.each_run do
  # This code will be run each time you run your specs. 
  #Подгружаем каждый раз все файлы из директории app/
  Dir["#{Rails.root}/app/**/*.rb"].each {|file| load file }
  #Подгружаем файл с описанием маршрутизации
  load "#{Rails.root}/config/routes.rb"
end