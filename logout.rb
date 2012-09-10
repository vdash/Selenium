require 'rubygems'
require 'selenium-webdriver'
wd = Selenium::WebDriver.for (
						:firefox,
						:remote,
  :url => "http://patrick_2600hz:7d4be256-bbbc-4ee9-9fa0-09b5491b0c5f@ondemand.saucelabs.com:80/wd/hub",
  :desired_capabilities => caps)

caps = Selenium::WebDriver::Remote::Capabilities.firefox
caps.version = "15"
caps.platform = :Linux
caps[:name] = "logintest"
  
wd.get "http://208.90.213.230/"
wd.find_element(:id, "login").click
wd.find_element(:id, "login").clear
wd.find_element(:id, "login").send_keys "pmccoy@2600hz.com"
wd.find_element(:id, "password").click
wd.find_element(:id, "password").clear
wd.find_element(:id, "password").send_keys "6xxxxxx"
wd.find_element(:id, "account_name").click
wd.find_element(:id, "account_name").clear
wd.find_element(:id, "account_name").send_keys "2600hz"
wd.find_element(:xpath, "//div[@class='login_div']//button[.='LOG IN']").click
wd.find_element(:xpath, "//div[@id='ws-topbar']/ul[2]/li[4]/ul/li[5]/a").click
wd.find_element(:id, "confirm_button").click
wd.quit


