
wd.find_element(:id, "accounts_manager-view").click


wd.find_element(:xpath, "//div[@id='accounts_manager-view']//button[.='Save']").click

wd.find_element(:xpath, "//div[@id='accounts_manager-view']//button[.='Use Account']").click
wd.find_element(:id, "confirm_button").click
wd.find_element(:xpath, "//div[@class='alert_buttons_wrapper']//button[.='Close']").click
wd.find_element(:xpath, "//div[@id='ws-topbar']/ul[1]/li[8]/ul/li[6]/ul/li[2]/a").click
wd.find_element(:xpath, "//div[@class='add_flow']//span[.='Add User']").click
wd.find_element(:id, "username").click
wd.find_element(:xpath, "//div[@class='whapp-header']//button[.='Advanced']").click
wd.find_element(:id, "username").click
wd.find_element(:id, "username").clear
wd.find_element(:id, "username").send_keys "Dimir"
wd.find_element(:id, "first_name").click
wd.find_element(:id, "first_name").clear
wd.find_element(:id, "first_name").send_keys "q"
wd.find_element(:id, "first_name").click
wd.find_element(:id, "email").click
wd.find_element(:id, "email").clear
wd.find_element(:id, "email").send_keys "pmccoy@2600hz.com"
wd.find_element(:xpath, "//div[@id='basic']/div[6]/div/ul/li[1]").click
if not wd.find_element(:id, "vm_to_email_enabled").selected?
    wd.find_element(:id, "vm_to_email_enabled").click
end
wd.find_element(:id, "last_name").click
wd.find_element(:id, "last_name").clear
wd.find_element(:id, "last_name").send_keys "Dimir"
wd.find_element(:id, "first_name").click
wd.find_element(:id, "first_name").clear
wd.find_element(:id, "first_name").send_keys "Szadek"
wd.find_element(:xpath, "//div[@id='user-view']//button[.='Save']").click
wd.find_element(:xpath, "//div[@id='ws-topbar']/ul[2]/li[4]/ul/li[5]/a").click
wd.find_element(:id, "confirm_button").click
wd.quit

#Select a user
wait.until { driver.find_element(:link => accFull) }
driver.find_element(:link, accFull).click
puts "User selected		SUCCESS"

