#CONFIG
url = "http://10.10.3.61"
username = "pmccoy@2600hz.com"
password = "6xxxxxx"
accountname = "Capsule Corp"

require 'rubygems'
require 'selenium-webdriver'
driver = Selenium::WebDriver.for :firefox
driver.manage.window.maximize
driver.navigate.to url
wait = Selenium::WebDriver::Wait.new(:timeout => 20)

#Login
wait.until { driver.find_element(:id => "login") }
driver.find_element(:name, "login").send_keys username
driver.find_element(:name, "password").send_keys password
driver.find_element(:name, "account_name").send_keys accountname
driver.find_element(:xpath, "//div[@class='login_div']//button[.='LOG IN']").click
puts "\nLogin			SUCCESS"

#click on pbx-connector
wait.until { driver.find_element(:xpath, "//div[@id='ws-topbar']/ul[1]/li[10]/a/div/span") }
driver.find_element(:xpath, "//div[@id='ws-topbar']/ul[1]/li[10]/a/div/span").click
puts "\nPBX click			SUCCESS"

#get test pbx
wait.until { driver.find_element(:xpath, "//div[2]/div/div[1]/div/div[3]/div/div/ul/li[2]/a") }
driver.find_element(:xpath, "//div[2]/div/div[1]/div/div[3]/div/div/ul/li[2]/a").click
puts "\nPBX get-test  SUCCESS"

#edit pbx
wait.until { driver.find_element(:xpath, "//div[@class='row']//button[.='Edit settings']") }
driver.find_element(:xpath, "//div[@class='row']//button[.='Edit settings']").click
puts "\nPBX edit  SUCCESS"

#delete pbx complete
wait.until { driver.find_element(:xpath, "//div[@id='edit_server']//button[.='Delete']") }
driver.find_element(:xpath, "//div[@id='edit_server']//button[.='Delete']").click
puts "\nPBX delete SUCCESS"
sleep(2)

#Logout
#Click on Dropdown menu
wait.until { driver.find_element(:xpath => "//div[@id='ws-topbar']/ul[2]/li[4]") }
driver.find_element(:xpath, "//div[@id='ws-topbar']/ul[2]/li[4]").click
#Click on Sign out button
wait.until { driver.find_element(:xpath => "//div[@id='ws-topbar']/ul[2]/li[4]/ul/li[5]/a") }
driver.find_element(:xpath, "//div[@id='ws-topbar']/ul[2]/li[4]/ul/li[5]/a").click
#Click Confirm
wait.until { driver.find_element(:id => "confirm_button") }
driver.find_element(:id, "confirm_button").click
#Wait for original page
wait.until { driver.find_element(:id => "login") }
puts "Logout			SUCCESS"

#Close Firefox
driver.quit
puts "\nTest			SUCCESS\n"
