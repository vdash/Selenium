#CONFIG
url = "http://10.10.3.61"
username = "pmccoy@2600hz.com"
password = "6xxxxxx"
accountname = "Capsule Corp"

accName= "Dimir"
accRealm= "dimir.sip.2600hz.com"

accUser= "Dimir"
accFirst= "Szedrik"
accLast= "Dimir"
accPw= "6xxxxxx"
#accFull= accFirst, accLast

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

#click on accounts
wait.until { driver.find_element(:xpath, "//div[@id='ws-topbar']/ul[1]/li[6]/a")}
driver.find_element(:xpath, "//div[@id='ws-topbar']/ul[1]/li[6]/a").click
puts "\nClick Accounts			SUCCESS"

#add user
wait.until { driver.find_element(:xpath, "//div[@class='add_flow']//span[.='Add Account']") }
driver.find_element(:xpath, "//div[@class='add_flow']//span[.='Add Account']").click
puts "\nadd	user     SUCCESS"

#add basic info
wait.until { driver.find_element(:id, "name").click }
driver.find_element(:id, "name").click
driver.find_element(:id, "name").clear
driver.find_element(:id, "name").send_keys accName
driver.find_element(:id, "realm").click
driver.find_element(:id, "realm").clear
driver.find_element(:id, "realm").send_keys accRealm
puts "Basics				SUCCESS"

#available apps
wait.until { driver.find_element(:link_text, "Available Apps") }
driver.find_element(:link_text, "Available Apps").click

if not driver.find_element(:id, "available_apps_voip").selected?
    driver.find_element(:id, "available_apps_voip").click
end
if not driver.find_element(:id, "available_apps_cluster").selected?
    driver.find_element(:id, "available_apps_cluster").click
end
	driver.find_element(:xpath, "//div[@id='applications']/div/div/ul/li[3]").click
if not driver.find_element(:id, "available_apps_userportal").selected?
    driver.find_element(:id, "available_apps_userportal").click
end
if not driver.find_element(:id, "available_apps_numbers").selected?
    driver.find_element(:id, "available_apps_numbers").click
end
if not driver.find_element(:id, "available_apps_pbxs").selected?
    driver.find_element(:id, "available_apps_pbxs").click
end
puts "Data 					SUCCESS"

#save
wait.until { driver.find_element(:xpath, "//div[@id='accounts_manager-view']//button[.='Save']") } 
driver.find_element(:xpath, "//div[@id='accounts_manager-view']//button[.='Save']").click
puts "Save 					SUCCESS"

#use account
wait.until { driver.find_element(:xpath, "//div[@id='accounts_manager-view']//button[.='Use Account']") }
driver.find_element(:xpath, "//div[@id='accounts_manager-view']//button[.='Use Account']").click
puts "Use account			SUCCESS"

#confirm
wait.until { driver.find_element(:id, "confirm_button") }
driver.find_element(:id, "confirm_button").click
puts "Confirm				SUCCESS"

#close the loaded button
wait.until { driver.find_element(:xpath, "//div[@class='alert_buttons_wrapper']//button[.='Close']") }
driver.find_element(:xpath, "//div[@class='alert_buttons_wrapper']//button[.='Close']").click
puts "Close Loaded button	SUCESS"


#after account has been made we create a user
#Hover over Hosted PBX
wait.until { driver.find_element(:xpath => "//div[@id='ws-topbar']/ul[1]/li[6]/a/div") }
el = driver.find_element(:xpath, "//div[@id='ws-topbar']/ul[1]/li[6]/a/div/span")
driver.action.move_to(el).perform
puts "Hover HPBX		SUCCESS"

#Hover over Advanced
wait.until { driver.find_element(:xpath => "//div[@id='ws-topbar']/ul[1]/li[6]/ul/li[6]/a/div/span") }

el = driver.find_element(:xpath, "//div[@id='ws-topbar']/ul[1]/li[6]/ul/li[6]/a/div/span")
driver.action.move_to(el).perform
puts "Hover ADV		SUCCESS"

#Click Users
wait.until { driver.find_element(:xpath => "//div[@id='ws-topbar']/ul[1]/li[6]/ul/li[6]/ul/li[2]/a") }
driver.find_element(:xpath, "//div[@id='ws-topbar']/ul[1]/li[6]/ul/li[6]/ul/li[2]/a").click
puts "Users			SUCCESS"

#create user
wait.until { driver.find_element(:xpath, "//div[@id='ws-topbar']/ul[1]/li[8]/ul/li[6]/ul/li[2]/a") }
driver.find_element(:xpath, "//div[@id='ws-topbar']/ul[1]/li[8]/ul/li[6]/ul/li[2]/a").click
puts "Create User 			SUCCESS"

#add user button
wait.until { driver.find_element(:xpath, "//div[@class='add_flow']//span[.='Add User']") }
driver.find_element(:xpath, "//div[@class='add_flow']//span[.='Add User']").click
puts "Add User				SUCCESS"

#fill in info and save
wait.until { driver.find_element(:id, "username") }
driver.find_element(:id, "username").click
driver.find_element(:id, "username").clear
driver.find_element(:id, "username").send_keys accUser
driver.find_element(:id, "first_name").click
driver.find_element(:id, "first_name").clear
driver.find_element(:id, "first_name").send_keys accFirst
driver.find_element(:id, "last_name").click
driver.find_element(:id, "last_name").clear
driver.find_element(:id, "last_name").send_keys accLast
driver.find_element( :xpath, "//div[@id='basic']/div[5]/div/select/option[1]").click
if not driver.find_element(:id, "vm_to_email_enabled").selected?
    driver.find_element(:id, "vm_to_email_enabled").click
end

#Click Advanced
wait.until { driver.find_element(:xpath => "//div[@class='whapp-header']//button[.='Advanced']") }
driver.find_element(:xpath, "//div[@class='whapp-header']//button[.='Advanced']").click
puts "Advanced		SUCCESS"

#Click Password Management
wait.until { driver.find_element(:link => "Password Management") }
driver.find_element(:link, "Password Management").click
puts "Password Management	SUCCESS"

#Change password
wait.until { driver.find_element(:id => "pwd_mngt_pwd1") }
driver.find_element(:id, "pwd_mngt_pwd1").clear
driver.find_element(:id, "pwd_mngt_pwd1").send_keys accPw
driver.find_element(:id, "pwd_mngt_pwd2").clear
wait.until { driver.find_element(:id => "pwd_mngt_pwd2") }
driver.find_element(:id, "pwd_mngt_pwd2").send_keys accPw
wait.until { driver.find_element(:xpath => "//div[@id='user-view']//button[.='Save']") }
driver.find_element(:xpath, "//div[@id='user-view']//button[.='Save']").click
puts "Password change		SUCCESS"
sleep(3)

#save full
wait.until { driver.find_element(:xpath, "//div[@id='user-view']//button[.='Save']") }
driver.find_element(:xpath, "//div[@id='user-view']//button[.='Save']").click
sleep(3)
puts "\nAccount save			SUCCESS"

#click confirm
wait.until { driver.find_element(:id, "confirm_button") }
driver.find_element(:id, "confirm_button").click
puts "Confirmed					SUCCESS"


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
