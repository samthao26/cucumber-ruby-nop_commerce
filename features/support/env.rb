require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'faker'
require 'rspec/expectations'
require 'allure-cucumber'
World(RSpec::Matchers)
Dir[File.join(File.dirname(__FILE__), '../pages/*.rb')].each { |file| require file }
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.configure do |config|
  config.app_host = 'http://localhost:8080'
  config.default_driver = :chrome
  config.default_max_wait_time = 10

end