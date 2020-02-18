require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "time"
require "date"

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = "https://www.voegol.com.br/pt"
end
