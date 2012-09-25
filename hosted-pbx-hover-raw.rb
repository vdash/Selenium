require 'rubygems'
require 'selenium-webdriver'
wd = Selenium::WebDriver.for :firefox

wd.get "http://10.10.3.61/"
wd.find_element(:id, "login").click
wd.find_element(:id, "login").clear
wd.find_element(:id, "login").send_keys "pmccoy@2600hz.com"
wd.find_element(:id, "password").click
wd.find_element(:id, "password").clear
wd.find_element(:id, "password").send_keys "6xxxxxx"
wd.find_element(:id, "account_name").click
wd.find_element(:id, "account_name").clear
wd.find_element(:id, "account_name").send_keys "Capsule Corp"
wd.find_element(:xpath, "//div[@class='login_div']//button[.='LOG IN']").click
wd.find_element(:link_text, "                                                        Hosted PBX         ").click
wd.find_element(:css, "a.dropdown-toggle").click
wd.find_element(:xpath, "//div[@id='ws-topbar']/ul[1]/li[8]/ul/li[6]/ul/li[2]/a").click
wd.quit
