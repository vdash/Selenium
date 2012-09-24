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

#add pbx
wait.until { driver.find_element(:xpath, "//div[@class='left_side_bar']//div[.='Add Server']") }
driver.find_element(:xpath, "//div[@class='left_side_bar']//div[.='Add Server']").click
puts "\nPBX add			SUCCESS"

#click the new pbx astrix
wait.until {driver.find_element(:xpath, "//div[@class='pbxs']/div[6]")}
driver.find_element(:xpath, "//div[@class='pbxs']/div[6]").click
driver.find_element(:id, "auth_auth_user").click
driver.find_element(:id, "auth_auth_user").clear
driver.find_element(:id, "auth_auth_user").send_keys "capcorp"
driver.find_element(:id, "auth_auth_password").click
driver.find_element(:id, "auth_auth_password").clear
driver.find_element(:id, "auth_auth_password").send_keys "6xxxxxx"
driver.find_element(:id, "server_name").click
driver.find_element(:id, "server_name").clear
driver.find_element(:id, "server_name").send_keys "capasterisk-test"
puts "\nPBX finish			SUCCESS"

#click save
wait.until { driver.find_element( :xpath, "//div[@class='buttons-right']//button[.='Save']") }
driver.find_element( :xpath, "//div[@class='buttons-right']//button[.='Save']").click
wait 
puts "\nPBX SAVE		SUCCESS"
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
