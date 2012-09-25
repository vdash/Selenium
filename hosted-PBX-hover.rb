#CONFIG
url = "http://192.168.1.92"
username = "vdash"
password = "password"
accountname = "vdash"

require 'rubygems'
require 'selenium-webdriver'
driver = Selenium::WebDriver.for :firefox
driver.manage.window.maximize
driver.navigate.to url
wait = Selenium::WebDriver::Wait.new(:timeout => 160)

#Login
wait.until { driver.find_element(:id => "login") }
driver.find_element(:name, "login").send_keys username
driver.find_element(:name, "password").send_keys password
driver.find_element(:name, "account_name").send_keys accountname
driver.find_element(:xpath, "//div[@class='login_div']//button[.='LOG IN']").click
puts "\nLogin			SUCCESS"


sleep(8)
puts "slept"
#Hover over Hosted PBX
wait.until { driver.find_element(:xpath, "//div[1]/div/div/div/ul[1]/li[6]/a") }
el = driver.find_element(:xpath, "//div[1]/div/div/div/ul[1]/li[6]/a")
driver.action.move_to(el).perform
puts "Hover HPBX		SUCCESS"

sleep(1)
puts "slept again"
#Hover over Advanced
wait.until { driver.find_element(:xpath, "//div[1]/div/div/div/ul[1]/li[6]/ul/li[6]/a") }
driver.action.move_to(el).perform
ele = driver.find_element(:xpath, "//div[1]/div/div/div/ul[1]/li[6]/ul/li[6]/a")
driver.action.move_to(ele).perform
puts "Hover ADV		SUCCESS"
#Click Users
wait.until { driver.find_element(:xpath, "//div[@id='ws-topbar']/ul[1]/li[6]/ul/li[6]/a") }
driver.find_element(:xpath, "//div[@id='ws-topbar']/ul[1]/li[6]/ul/li[6]/a").click
puts "Users			SUCCESS"

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
