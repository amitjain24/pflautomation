=begin
/* 
* Copyright (c) 2018-2019 PFL. All rights reserved.
*/
=end

module SFLT
extend RSpec::Matchers
extend Capybara::DSL

# Locators
$sflt_help_button = "//button[contains(.,'Salesforce Help')]"
#$sflt_app_launcher = "//button[@class='slds-button']"
$sflt_app_launcher = "//div[contains(@class, 'slds-icon-waffle')]/.."
$sflt_select_app_input = "//input[contains(@placeholder, 'Search apps or items...')]"
$sflt_select_list_view = "//a[contains(@title, 'Select List View')]"
$sflt_show_option_on_record =  "//a[contains(@title, 'Show 7 more actions')]"
$sflt_logout_button_image = "//span[@class='photoContainer forceSocialPhoto']"
$sflt_logout = "Log Out"
$sflt_setup_icon =  "//div[@class='setupGear']"
$sflt_setup_link  = "//span[@class='tooltip-invisible' and contains(.,'Setup')]"
$sflt_required_profile_search_result = "//table//td[contains(.,'PFL_auto_custom_profile')]"
$sflt_edit_button_on_contact = "//td[@id='bottomButtonRow']/input[@value=' Edit ']"
$sflt_save_button = "//button[@title='Save']"
#{}"//li[@id='related_setup_app_home']/a/div/div/span/span[2]"
#{}"//span[contains(.,'Setup')]"


# salesforce profile
############################################
#  general methods
############################################
	# open_all_tabs, will click on all tab image "+"
	# @return null
	def SFLT.click_app_launcher
		UTIL.re_execute_script_block do
			#UTIL.min_wait
			UTIL.page_refresh
			find(:xpath, $sflt_app_launcher,visible:true).click
			if(page.has_xpath?$sflt_select_app_input, visible:true)
				puts "clicked on launcher successfully"
			end 
		end
	end

	# to select an app from the app launcher, in case of SF lightning
	# @param tabname String = name of the tab which has to be opened
	# @return null 
	def SFLT.select_app appname
		begin
			SFLT.click_app_launcher
			find(:xpath, $sflt_select_app_input,:wait => 30).set appname
			UTIL.min_wait
			#find(:css, "a[title='"+appname+"']", :wait => 30).click
			find(:xpath, "//mark[contains(text(), '"+appname+"')]",:wait => 30).click
			UTIL.page_load_waiting
		rescue Exception=>e
 			logger.error "#{e.backtrace.join("\n")}"
 		end		
	end

	# to select view filter to get the list of users
	# @param view_name String = name of the view
	def SFLT.select_lightning_list_view view_name
		UTIL.scroll_to $sflt_select_list_view
		find(:xpath, $sflt_select_list_view,:wait => 30).click
		UTIL.re_execute_script_block do
			#find(:css, a[])
			find(:xpath, "//span[contains(text(), '"+view_name+"')]/..",:wait => 30).click
		end
		UTIL.page_load_waiting
	end

	# click_setup, will click on setup link to get display with salesforce setting
	# @return null
	def SFLT.click_setup
		UTIL.re_execute_script_block do
			find(:xpath, $sfl_app_user_navigation_button).click
			UTIL.min_wait
			click_link $sfl_setup
		end
		UTIL.wait_object_appear $sfl_get_started
	end
end
