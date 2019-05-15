=begin
/* 
* Copyright (c) 2018-2019 PFL. All rights reserved.
*/
=end

module SFL
extend RSpec::Matchers
extend Capybara::DSL

# Locators
$sfl_app_button = '#tsidButton'
$sfl_app_label = '#tsidLabel'
$sfl_app_menu = '#tsidMenu'
$sfl_app_user_navigation_button = "//div[contains(@id, 'userNav-arrow')]"
$sfl_app_user_navigation_menu_items = '#userNav-menuItems'
$sfl_close_lighting_option = "//a[contains(@id, 'tryLexDialogX')]"
$sfl_all_tabs_img = "//img[contains(@title, 'All Tabs')]"
$sfl_all_tabs_heading ="//h1[contains(text(), 'All Tabs')]"
$sfl_logout = "Logout"
$sfl_setup = 'Setup'
$sfl_get_started =  "//input[contains(@title, 'Get Started')]"
$sfl_login = "Login"
$sfl_create = "Create"
$sfl_objects = "Objects"
$sfl_save_button = "Save"
$sfl_edit_button = "Edit"
$sfl_delete_button = "Delete"
$sfl_new_button = "New"
$sfl_go = "Go!"
$sfl_manage_user = "Manage Users"
$sfl_profiles = "Profiles"
$sfl_apex_job = "Apex Jobs"
$sfl_new_custom_obj = "//input[contains(@value, 'New Custom Object')]"
$sfl_page_layout_button_target_location = "//legend[contains(text(), 'Custom Buttons')]/..//div"
$sfl_swag_iq_send_batch_job_status = "//table[@class='list']//tr//td//a[contains(text(), 'SwagIQSendBatch')]/ancestor::tr[1]//td[3]"
$sfl_body_cell = "//*[@id='bodyCell']"
$sfl_select_page_layout_button ="//*[@id='troughCategory__Button']"
$sfl_select_page_layout_field_section ="//*[@id='troughCategory__Field']"
$sfl_page_layout_quick_search_field = "//input[contains(@id, 'quickfind')]"
$sfl_button_scroll_section = "//*[contains(@id, 'PLATFORM_ACTION')]"
$sfl_field_scroll_section = "//div[contains(@class, 'canvasDrop')]"
$sfl_field_drop_section = "//div[contains(@class, 'section fieldDrop')][2]"
$sfl_quick_global_search = "//input[contains(@class, 'quickFindInput')]"
$sfl_batch_job_list = "//table[@class='list']//tr"
$sfl_inside_body = "//*[@id='bodyCell']"
$sfl_switch_to_lightning = "//a[contains(@class, 'switch-to-lightning')]"
$sfl_view_profile = "//div[contains(@class, 'profileTrigger')]//span"
$sfl_switch_to_classic = "//a[contains(text(), 'Switch to Salesforce Classic')]"
$sfl_batch_job_status_in_progress = "Processing"
$sfl_batch_job_status_preparing = "Preparing"
$sfl_batch_job_status_holding = "Holding"
$sfl_batch_job_status_queued = "Queued"
$sfl_search_frame = 'searchFrame'
$sfl_search_frame_input_id = 'lksrch'
$sfl_results_frame = 'resultsFrame'
$sfl_list_view_drop_down = "//select[@name='fcf']"
$sfl_users = "Users"
$send_marketing_materials = "//td[@id='topButtonRow']/input[@title='Send Marketing Materials']"
$sfl_alphabet = "S"
$sfl_link_all = "All"
$sfl_xpath_of_user_on_users_page = "//th/a[contains(.,'Standard_User, Nishant')]"
$sfl_xpath_of_profile_of_user = "//th/a[contains(.,'Standard_User, PFL_Auto')]/../following-sibling::td/a[contains(.,'stnd_user_wo_assign_p_set')]"
$sfl_xpath_of_edit_button_of_user1 =  "//input[@title='Select Standard_User, Nishant']/../a[1]"
$sfl_xpath_of_edit_button = "//td/a[contains(@title,'Standard_User, Nishant') and contains(.,'Edit')]"
$sfl_profile_drop_down = "//select[@id='Profile']"
$sfl_required_profile = "//select[@id='Profile']/option[contains(.,'stnd_user_wo_assign_p_set')]"
$get_profile_name = "//tbody//th[contains(.,'Standard_User, PFL_Auto')]/../td[contains(.,'Standard User')]"
$assign_p_set_checkbox = "//tr/td[contains(.,'Assign Permission Sets')]/following-sibling::td[1]"
$assign_p_set_label = "//td[label='Assign Permission Sets']/./following-sibling::td/input[@title='Assign Permission Sets']"
$required_profile_xpath = "//div/a/span[contains(.,'PFL_auto_custom_profile')]"
$assign_p_set_checked = "//tr/td[contains(.,'Assign Permission Sets')]/following-sibling::td[1]/img[@title='Checked']"
$sfl_username = "//input[@name = 'username']"
$sfl_required_profile_name = "PFL_auto_custom_profile"
$sfl_do_not_swag_back_button = "//button[text()='Back']"
$sfl_username_field = "//input[@name='username']"
$sfl_global_search_textbox = "//input[@title='Search Salesforce']"

############################################
# general methods
############################################

	# to select application from Salesforce UI
	# @param appname String = the name of application want to select would pass a parameter
	def SFL.select_app appname
		selectedApp = find($app_button).find($sfl_app_label).text
		if (appname !=selectedApp)
			find($app_button).click
			UTIL.min_wait
			find($sfl_app_menu).find("#tsid-menuItems").find(:link,"#{appname}").click
			UTIL.page_load_waiting
		end
	end

	# to verify the version of salesforce just after logging in
	def SFL.verify_login_on_required_version
	puts IS_LIGHTNING_ENABLE
		if(IS_LIGHTNING_ENABLE)
			if(SFL.verify_login_on_lightning)
				logger.info 'already on lightning'
			else
				logger.info 'switching on lightning'
				SFL.switch_to_lightning
			end
		else
			if(SFL.verify_login_on_classic)
				logger.info 'already on classic'
			else
				logger.info 'switching on classic'
				SFL.switch_to_classic
			end
		end
	end

	# to verify if user is on classic mode, just after logging in
	# returns true if user is on SF classic version, else false
	def SFL.verify_login_on_classic
		if(page.has_xpath?($sfl_switch_to_lightning))
			return true
		else
			return false
		end
	end

	# to verify if user is on classic mode, just after logging in
	# returns true if user is on SF lightning version, else false
	def SFL.verify_login_on_lightning
		if(page.has_no_xpath?($sfl_switch_to_lightning))
			return true
		else
			return false
		end
	end

	# to switch on SF lightning from SF classic
	def SFL.switch_to_lightning
		if(page.has_xpath?($sfl_switch_to_lightning))
			find(:xpath, $sfl_switch_to_lightning,:visible =>true ,:wait => 50).click
			UTIL.med_wait
		end
	end

	# to switch on SF classic from SF lightning
	def SFL.switch_to_classic
		begin
			find(:xpath, $sfl_view_profile,:visible =>true ,:wait => 50).click
		rescue Exception=>e
			logger.error "Exception => #{e.backtrace.join("\n")}"
		end
		UTIL.min_wait
		find(:xpath, $sfl_switch_to_classic,:visible =>true ,:wait => 50).click
		UTIL.min_wait
	end

	# open_all_tabs, will click on all tab image "+"
	def SFL.open_all_tabs
		UTIL.re_execute_script_block do
			find(:xpath, $sfl_all_tabs_img).click
		end
		UTIL.wait_object_appear $sfl_all_tabs_heading
	end

	# open_tab, will open required tab from the list of all tab
	# @param tabname String= name of the tab which has to be opened
	def SFL.open_tab tabname
		if(IS_LIGHTNING_ENABLE)
			SFLT.select_app tabname
		else
			UTIL.re_execute_script_block do
				SFL.open_all_tabs
				find(:xpath,"//table[@class='detailList tabs']//a[contains(text(),'"+tabname+"')]",:wait => 30).click
				UTIL.min_wait
				if(page.has_xpath?($sfl_close_lighting_option))
					find(:xpath, $sfl_close_lighting_option).click
				end
				element_found = page.has_xpath?($sfl_all_tabs_heading)
				if (element_found ==true)
				   raise "Not able to found tab:" + tabname
				else
					break
				end
			end
		end
		UTIL.page_load_waiting
	end

	# to select the view filter in order to get the required data
	# @param view_name String = name of the view, which shows our required data on the page
	def SFL.select_list_view view_name
		if(IS_LIGHTNING_ENABLE)
			SFLT.select_lightning_list_view view_name
		else
			UTIL.re_execute_script_block do
				find(:xpath, $sfl_list_view_drop_down,:visible =>true ,:wait => 50).click
				find(:xpath, "//option[contains(text(),'"+view_name+"')]",:visible =>true ,:wait => 50).click
				if(page.has_xpath? "//input[@name='go']")
					find(:xpath, "//input[@name='go']",:visible =>true ,:wait => 50).click
					#SFL.click_button_go
					logger.info 'clicked on go button first time'
				end
			end
		end
	end

	# to click_setup, will click on setup link to get display with salesforce setting
	def SFL.click_setup
		if(IS_LIGHTNING_ENABLE)
			SFL.click_setup_lightning
		else
			SFL.click_setup_classic
		end
	end

	# to click_setup, will click on setup link to get display with salesforce setting, in SF classic
	def SFL.click_setup_classic
		UTIL.re_execute_script_block do
			find(:xpath, $sfl_app_user_navigation_button).click
			UTIL.min_wait
			click_link $sfl_setup
		end
		UTIL.wait_object_appear $sfl_get_started
	end


	# to click_setup, will click on setup link to get display with salesforce setting, in SF classic
	def SFL.click_setup_lightning
		UTIL.re_execute_script_block do
			find(:xpath, $sflt_setup_icon,:visible =>true ,:wait => 50).click
			puts "clicked on setup icon"
			UTIL.min_wait
			click_link $sflt_setup_link
			logger.info 'clicked on setup link text'
		end
		within_window(switch_to_window(windows.last)) do
			logger.info 'switched to recently opened window'
		end
	end

	# to open_object, open salesforce object
	# @param : object_name
	def SFL.open_object object_name
		SFL.click_setup
		UTIL.re_execute_script_block do
			click_link $sfl_create
		end
		UTIL.min_wait
		UTIL.re_execute_script_block do
			click_link $sfl_objects
		end
		UTIL.wait_object_appear $sfl_new_custom_obj
		UTIL.re_execute_script_block do
			click_link object_name
		end
		UTIL.min_wait
	end

	# to clone the existing profile, where you are standing
	# @param profilenameString = name of the  profile, you want to clone
	# @param clone_name String= name of the new clone profile
	def SFL.clone_existing_profile profilename, clone_name
		SFL.click_setup
		click_link $sfl_manage_user
		UTIL.page_load_waiting
		click_link $sfl_profiles
		UTIL.page_load_waiting
		click_link profilename[0]
		if(page.has_xpath?($sfl_close_lighting_option))
			find(:xpath, $sfl_close_lighting_option).click
		end
		sleep $sf_wait_less
		gen_scroll_to "//a/span[text()='#{permission_set_name}']"
		find(:xpath,"//a/span[text()='#{permission_set_name}']").click
		SFL.click_button buttonName
		UTIL.page_load_waiting
	end

	# to login in Salesforce
	# @param userName String = userName of the user through which you want to login
	# @param userPassword  String = password of the user through which you want to login
	def SFL.login userName, userPassword
		logger.info "Logged in With " + userName
		window_maximize
		visit $SALESFORCE_URL
		fill_in $SALESFORCE_USERNAME, :with => userName
		fill_in $SALESFORCE_PASSWORD, :with => userPassword
		SFL.click_button $sfl_login
		logger.info 'Clicking to Login Button'
		if page.has_xpath?"//h2[contains(.,'Your session has ended')]"
			find(:xpath, "//button[contains(.,'Return to Page')]").click
			logger.info 'continuing with current session' 
		end 
		#click_button_classic $sfl_login
		if(page.has_xpath?($sfl_close_lighting_option))
			find(:xpath, $sfl_close_lighting_option).click
		end
		UTIL.page_load_waiting
		verify_login_on_required_version
	end

	# to logout from current user
	def SFL.logout
		logger.info 'entered in logout method'
		if(IS_LIGHTNING_ENABLE)
			find(:xpath, $sflt_logout_button_image).click
			logger.info 'clicked on logout image'
			find(:link, $sflt_logout).click
			logger.info 'logged out from current user'
		else
		UTIL.scroll_to $sfl_app_user_navigation_button
		find(:xpath, $sfl_app_user_navigation_button).click
		UTIL.re_execute_script_block do
			find($sfl_app_user_navigation_menu_items).find(:link,$sfl_logout).click
			#find(:link,$sfl_logout).click
		end
		logger.info 'logged out successfully'
		UTIL.page_load_waiting
		end
		logger.info 'Logout from current user'
	end

	# to perform Salesforce global search
	def SFL.click_global_search_value searchValue
		SFL.click_setup
		UTIL.page_load_waiting
		find(:xpath, $sfl_quick_global_search).set searchValue
		click_link searchValue
		UTIL.min_wait
		UTIL.page_load_waiting
	end

	# to wait for apex job to finish
	def SFL.wait_for_swag_iq_apex_job_to_finish
		job_completed = true
		while(job_completed) do
			SFL.click_global_search_value $sfl_apex_job
			UTIL.page_load_waiting
			Array rows_list = all(:xpath, $sfl_batch_job_list)
			job_completed = false
			status_value = find(:xpath, $sfl_swag_iq_send_batch_job_status).text
			if(status_value == $sfl_batch_job_status_in_progress || status_value == $sf_batch_process_status_preparing || status_value ==$sfl_batch_job_status_queued || status_value == $sfl_batch_job_status_holding)
				job_completed = true
			end
		end
	end

	# to add field on object page layout
	def SFL.add_field_on_object_page_layout object_name, page_layout_name, field_name
		field_source_path = "//span[text()= '"+field_name+"']/.."
		page_layout_edit_path = "//*[text()= '"+page_layout_name+"']//../td[1]/a[1]"
		SFL.open_object object_name
		UTIL.re_execute_script_block do
			find(:xpath, page_layout_edit_path).click
		end
		within(:xpath, $sfl_body_cell) do
			find(:xpath, $sfl_select_page_layout_field_section).click
			UTIL.min_wait
			find(:xpath, $sfl_page_layout_quick_search_field).set(field_name)
			UTIL.min_wait
			UTIL.scroll_to $sfl_button_scroll_section
			if (field_name.size > 22)
				new_field_name = field_name[0..20]
				field_source_path = "//span[contains(text() ,'"+new_field_name+"')]/.."
			end
			UTIL.min_wait
			UTIL.scroll_to $sfl_button_scroll_section
			UTIL.re_execute_script_block do
				source = first(:xpath, field_source_path)
				target = find(:xpath, $sfl_field_drop_section)
				source.drag_to(target)
				puts "item droped"
				UTIL.min_wait
				if (page.has_xpath?("//div[contains(@class, 'canvasDrop')]//span[contains(text() , '"+field_name+"')]"))
					puts "Field :#{field_name} : added successfully on layout."
				else
					raise "Error: #{field_name} not added successfully on layout."
				end
			end
		end
		SFL.click_button $sfl_save_button
		UTIL.min_wait
	end

	# to remove field from object page layout
	def SFL.remove_field_object_page_layout object_name, page_layout_name, field_name
		page_layout_edit_path = "//*[text()= '"+page_layout_name+"']//../td[1]/a[1]"
		SFL.open_object object_name
		UTIL.re_execute_script_block do
			find(:xpath, page_layout_edit_path).click
		end
		within(:xpath, $sfl_body_cell) do
			UTIL.re_execute_script_block do
				source = find(:xpath, "//div[contains(@class, 'section fieldDrop')][2]//div[contains(@class, 'itemLabel')]//span[contains(text(), '"+field_name+"')]/..")
				target = find(:xpath, "//div[contains(@class, 'item used')]//span[contains(text(), '"+field_name+"')]")
				target.drag_to(target)
				puts "item droped"
				UTIL.min_wait
			end
			UTIL.re_execute_script_block do
				source = find(:xpath, "//div[contains(@class, 'section fieldDrop')][2]//div[contains(@class, 'itemLabel')]//span[contains(text(), '"+field_name+"')]/..")
				target = find(:xpath, "//div[contains(@class, 'item used')]//span[contains(text(), '"+field_name+"')]")
				source.drag_to(target)
				puts "item droped"
				UTIL.min_wait
			end
		end
		SFL.click_button $sfl_save_button
		UTIL.min_wait
	end

	# to add button on object page layout
	def SFL.add_button_to_object_page_layout object_name, page_layout_name, button_name
		button_source_path = "//span[text()= '"+button_name+"']/.."
		page_layout_edit_path = "//*[text()= '"+page_layout_name+"']//../td[1]/a[1]"

		SFL.click_setup
		UTIL.re_execute_script_block do
			click_link $sfl_create
		end
		
		UTIL.min_wait
		UTIL.re_execute_script_block do
			click_link $sfl_objects
		end
		
		UTIL.wait_object_appear $sfl_new_custom_obj

		UTIL.re_execute_script_block do
			click_link object_name
		end
		UTIL.min_wait

		UTIL.re_execute_script_block do
			find(:xpath, page_layout_edit_path).click
		end
		
		within(:xpath, $sfl_body_cell) do
			find(:xpath, $sfl_select_page_layout_button).click
			UTIL.min_wait
			find(:xpath, $sfl_page_layout_quick_search_field).set(button_name)
			UTIL.min_wait
			UTIL.scroll_to $sfl_button_scroll_section
			if (button_name.size > 22)
				new_button_name = button_name[0..20]
				button_source_path = "//span[contains(text() ,'"+new_button_name+"')]/.."
			end
			UTIL.min_wait

			UTIL.re_execute_script_block do
				source = first(:xpath, button_source_path)
				target = find(:xpath, $sfl_page_layout_button_target_location)
				source.drag_to(target)
				source.drag_to(target)
				UTIL.min_wait

				if (page.has_xpath?("//div[text() = '"+button_name+"']"))
					puts "Button :#{button_name} : added successfully on layout."
				else
					raise "Error: #{button_name} not added successfully on layout."
				end
			end
		end
		SFL.click_button $sfl_save_button
		UTIL.min_wait
	end

	# Method to click on salesforce general method
	# @param buttonName = name of the button, on which you want to click
	def SFL.click_button buttonName
		if(IS_LIGHTNING_ENABLE)
			 SFL.click_button_classic buttonName
		else
			SFL.click_button_classic buttonName
		end
	end

	# Method to click on salesforce general method, in SF classic
	# @param buttonName = name of the button, on which you want to click
	def SFL.click_button_classic buttonName
		UTIL.re_execute_script_block do
			first(:button, buttonName).click
		end
		UTIL.page_load_waiting
	end

	# Method to click on salesforce general method, in SF lightning
	# @param buttonName String = name of the button, on which you want to click
	def SFL.click_button_lightning buttonName
		UTIL.re_execute_script_block do
			find(:xpath, "//a/div[contains(.,'"+buttonName+"')]").click
		end
		UTIL.page_load_waiting
	end



############################################
# general browser related
############################################
	# to click on "OK" button appears on any alert on page
	def SFL.alert_ok
		if page.driver.class == Capybara::Selenium::Driver
			page.driver.browser.switch_to.alert.accept
		elsif page.driver.class == Capybara::Webkit::Driver
			page.driver.switch_to.alert.accept
		end
	end

	# to click on "cancel" button appers on any alert on page
	def SFL.alert_cancel

	end

	# to click on "go" button
	def SFL.click_button_go
		UTIL.re_execute_script_block do
			click_button $sfl_go
		end
		UTIL.page_load_waiting
	end

	# to go to a URL
	def SFL.go_to_url url_suffix
		url_prefix = page.current_url.split('/')[0]
		url_host = page.current_url.split('/')[2]
		visit url_prefix + "//" + url_host + url_suffix
		SFL.wait_for_page_load
	end

	# to fill in any text box in salesforce application(excluding third party app)
	# @param field_path String = xpath of the field, you want to fill in
	# @param field_value String = the value you want to put in text box
	def SFL.fill_text_box field_path, field_value
		if(IS_LIGHTNING_ENABLE)
			 SFL.fill_text_box_lightning field_path, field_value
		else
			SFL.fill_text_box_classic field_path, field_value
		end
	end

	# to create a new contact user in salesforce
	def SFL.create_new_contact first_n_value, last_n_value, mailing_address_street, mailing_address_zipcode, mailing_country_value
		if(IS_LIGHTNING_ENABLE)
			 SFL.create_new_contact_lightning first_n_value, last_n_value, mailing_address_street, mailing_address_zipcode, mailing_country_value
		else
			SFL.create_new_contact_classic first_n_value, last_n_value, mailing_address_street, mailing_address_zipcode, mailing_country_value
		end
	end

	# to create a new contact in SF classic
	def SFL.create_new_contact_classic first_n_value, last_n_value, mailing_address_street, mailing_address_zipcode, mailing_country_value
		SFL.click_button $sfl_new_button
		SFL.fill_text_box $con_first_name, first_n_value
		SFL.fill_text_box $con_last_name, last_n_value
		SFL.fill_text_box $con_address_mailing_street, mailing_address_street
		SFL.fill_text_box $con_address_mailing_zipcode, mailing_address_zipcode
		SFL.fill_text_box $con_address_mailing_country, mailing_country_value
		SFL.click_button $sfl_save_button
	end

	# to create a new contact in SF lightning
	def SFL.create_new_contact_lightning first_n_value, last_n_value, mailing_address_street, mailing_address_zipcode, mailing_country_value
		find(:xpath, "//div[@title='New']").click
		within_window(switch_to_window(windows.last)) do	
		find(:xpath, "//input[@placeholder='First Name']").set first_n_value
		find(:xpath, "//input[@placeholder='Last Name']").set last_n_value
		find(:xpath, "//textarea[@placeholder='Mailing Street']").set mailing_address_street
		find(:xpath, "//input[@placeholder='Mailing Zip/Postal Code']").set mailing_address_zipcode
		find(:xpath, "//input[@placeholder='Mailing Country']").set mailing_country_value
		find(:xpath, "//button[@title='Save']").click
		end
	end

	# to create a new contact user in salesforce
	def SFL.create_new_contact_record first_n_value, last_n_value, mailing_address_street,mailing_city,mailing_state, mailing_address_zipcode, mailing_country_value,phone_value
		if(IS_LIGHTNING_ENABLE)
			 SFL.create_new_contact_record_lightning first_n_value, last_n_value, mailing_address_street,mailing_city,mailing_state, mailing_address_zipcode, mailing_country_value,phone_value
		else
			SFL.create_new_contact_record_classic first_n_value, last_n_value, mailing_address_street,mailing_city,mailing_state, mailing_address_zipcode, mailing_country_value,phone_value
		end
	end

	# to create a new contact in SF classic
	def SFL.create_new_contact_record_classic first_n_value, last_n_value, mailing_address_street,mailing_city,mailing_state, mailing_address_zipcode, mailing_country_value,phone_value
		SFL.click_button $sfl_new_button
		SFL.fill_text_box $con_first_name, first_n_value
	    SFL.fill_text_box $con_last_name, last_n_value
	    SFL.fill_text_box $con_address_mailing_street, mailing_address_street
	    SFL.fill_text_box $con_address_mailing_city, mailing_city
	    SFL.fill_text_box $con_address_mailing_state, mailing_state
	    SFL.fill_text_box $con_address_mailing_zipcode, mailing_address_zipcode
	    SFL.fill_text_box $con_address_mailing_country, mailing_country_value
	    SFL.fill_text_box $con_phone, phone_value
	    SFL.click_button $sfl_save_button
	end

	# to create a new contact in SF lightning
	def SFL.create_new_contact_record_lightning first_n_value, last_n_value, mailing_address_street,mailing_city,mailing_state, mailing_address_zipcode, mailing_country_value,phone_value
		find(:xpath, "//div[@title='New']").click
		within_window(switch_to_window(windows.last)) do
		find(:xpath, "//input[@placeholder='First Name']").set first_n_value
		find(:xpath, "//input[@placeholder='Last Name']").set last_n_value
		find(:xpath, "//textarea[@placeholder='Mailing Street']").set mailing_address_street
		find(:xpath, "//input[@placeholder='Mailing City']").set mailing_city
		find(:xpath, "//input[@placeholder='Mailing State/Province']").set mailing_state
		find(:xpath, "//input[@placeholder='Mailing Zip/Postal Code']").set mailing_address_zipcode
		find(:xpath, "//input[@placeholder='Mailing Country']").set mailing_country_value
		find(:xpath, "//span[text()= 'Phone']/../following-sibling::input[@type='tel']").set phone_value
		find(:xpath, "//button[@title='Save']").click
		end
	end

	# to create a new contact user in salesforce
	def SFL.delete_contact_record 
		if(IS_LIGHTNING_ENABLE)
			 SFL.delete_contact_record_lightning 
		else
			SFL.delete_contact_record_classic 
		end
	end

	def SFL.delete_contact_record_lightning
		#SFL.click_button $sfl_delete_button
		#SFL.alert_ok
	end	

	def SFL.delete_contact_record_classic
		SFL.click_button $sfl_delete_button
		SFL.alert_ok
		puts "Contact deleted"
	end	
	# to fill in any text box in salesforce application(excluding third party app), in SF classic
	# @param field_path String = xpath of the field, you want to fill in
	# @param field_value = the value you want to put in text box
	def SFL.fill_text_box_classic field_path, field_value
		find(:xpath, field_path).set field_value
	end

	def SFL.fill_text_box_lightning field_path, field_value
		puts "value of field_path is #{field_path}"
	end
	# to check the created profile in setup section
	# @param mandatory_profile_name String = name of the mandatory profile, which a user is expected to have
	# @param component_xpath String = xpath of the mandatory profile
	# @param assign_p_set_checked String = xpath of the checkbox "assign permission set"
	def SFL.check_created_profile mandatory_profile_name, component_xpath, assign_p_set_checked
		if(IS_LIGHTNING_ENABLE)
			 SFL.check_created_profile_lightning mandatory_profile_name, component_xpath, assign_p_set_checked
		else
			SFL.check_created_profile_classic mandatory_profile_name, component_xpath, assign_p_set_checked
		end
	end

	# to check the created profile in setup section, in SF classic
	# @param mandatory_profile_name string = name of the mandatory profile, which a user is expected to have
	# @param component_xpath String = xpath of the mandatory profile
	# @param assign_p_set_checked String = xpath of the checkbox "assign permission set"
	def SFL.check_created_profile_classic mandatory_profile_name, component_xpath, assign_p_set_checked
		SFL.click_setup
		click_link $sfl_manage_user
		UTIL.page_load_waiting
		click_link $sfl_profiles
		UTIL.page_load_waiting
		if UTIL.verify_xpath_on_page component_xpath
			puts "yes, expected profile exists"
		end
		find(:xpath,component_xpath).click
		puts "clicked on expected profile name"
		if UTIL.verify_xpath_on_page assign_p_set_checked
			puts "assign permission set option is checked which is expected"
		else
			puts "assign permission set option is not checked currently so need to check"
			SFL.click_button $sfl_edit_button
			UTIL.min_wait
			find(:xpath,$assign_p_set_label).click
			UTIL.min_wait
			SFL.click_button $sfl_save_button
			UTIL.min_wait
			if UTIL.verify_xpath_on_page assign_p_set_checked
				puts "assign permission set option is checked now which is expected"
			end
		end
	end

	# to check the created profile in setup section, in SF lightning
	# @param mandatory_profile_name String = name of the mandatory profile, which a user is expected to have
	# @param component_xpath String= xpath of the mandatory profile
	# @param assign_p_set_checked String= xpath of the checkbox "assign permission set"
	def SFL.check_created_profile_lightning mandatory_profile_name, component_xpath, assign_p_set_checked
		# page.evaluate_script('window.confirm = function() { return true; }')
		# find(:xpath, $sflt_setup_icon).click
		# sleep 5
		# UTIL.press_keys_on_page :escape
		# sleep 2
		# UTIL.press_keys_on_page :escape
		# sleep 2
		# UTIL.press_keys_on_page :escape
		#fill_in 'Search Setup', with: mandatory_profile_name
		find(:xpath, "//input[@title='Search Salesforce']").click
		find(:xpath, "//input[@title='Search Salesforce']").set 'setup home'

		#find(:xpath,"//li//span[@title='Setup Home']").click
		UTIL.press_keys_on_page :enter
		find(:xpath,"//span/span[contains(.,'Profiles')]").click
		UTIL.page_load_waiting
		if UTIL.verify_xpath_on_page "//table//td[contains(.,'"+$standard_user_full_name+"')]"
			puts "yes, expected profile exists"
		end
		find(:xpath,"//table//td[contains(.,'"+mandatory_profile_name+"')]").click
		puts "clicked on expected profile name"
		if UTIL.verify_xpath_on_page assign_p_set_checked
			puts "assign permission set option is checked which is expected"
		else
			puts "assign permission set option is not checked currently so need to check"
			SFL.click_button $sfl_edit_button
			UTIL.min_wait
			find(:xpath,$assign_p_set_label).click
			UTIL.min_wait
			SFL.click_button $sfl_save_button
			UTIL.min_wait
			if UTIL.verify_xpath_on_page assign_p_set_checked
				puts "assign permission set option is checked now which is expected"
			end
		end
	end

	# to check user profile, if he has the mandatory(required) or not
	# @param mandatory_profile_name String = name of the required profile
	def SFL.check_user_profile mandatory_profile_name, standard_user_full_name
		if(IS_LIGHTNING_ENABLE)
			SFL.check_user_profile_lightning mandatory_profile_name, standard_user_full_name
		else
			SFL.check_user_profile_classic mandatory_profile_name, standard_user_full_name
		end
	end

	# to check user profile, if he has the mandatory(required) or not, in SF classic
	# @param mandatory_profile_name String = name of the required profile
	def SFL.check_user_profile_classic mandatory_profile_name, standard_user_full_name
		SFL.click_setup
		click_link $sfl_manage_user
		UTIL.page_load_waiting
		click_link $sfl_users
		UTIL.page_load_waiting
		if UTIL.verify_xpath_on_page $sfl_xpath_of_user_on_users_page
			puts "yes, user exists on users page"
			UTIL.min_wait
			find(:xpath,$sfl_xpath_of_edit_button).click
			puts "clicked on user name"
			UTIL.min_wait
			find(:xpath,$sfl_profile_drop_down).click
			find(:xpath,"//select[@id='Profile']/option[contains(.,'"+mandatory_profile_name+"')]").click
			UTIL.min_wait
			SFL.click_button $sfl_save_button
			UTIL.min_wait
			if page.has_xpath?("//th/a[contains(.,'"+standard_user_full_name+"')]/../following-sibling::td/a[contains(.,'"+mandatory_profile_name+"')]")
			 puts "profile #{mandatory_profile_name} is assigned to user now"
			end
		else
			puts "no, user doesn't exist on the page"
		end
	end

	# to check user profile, if he has the mandatory(required) or not, in SF lightning
	# @param mandatory_profile_name String = name of the required profile
	def SFL.check_user_profile_lightning mandatory_profile_name, standard_user_full_name
		find(:xpath, $sfl_global_search_textbox).click
		find(:xpath, $sfl_global_search_textbox).set standard_user_full_name
		UTIL.press_keys_on_page :enter
		find(:xpath, "//tbody//a[contains(.,'"+$standard_user_full_name1_lgt+"')]").click
		find(:xpath, "//li/a[@title='User Detail']").click
		puts "clicked on user detail button"
		UTIL.page_load_waiting
		within_frame(find(:xpath, $admin_lightning_frame)) do
			puts  "I am withing lightning frame"
			find(:xpath, $sflt_edit_button_on_contact).click
			puts "clicked on edit button successfully"
			UTIL.min_wait
		end
		UTIL.page_load_waiting

		within_frame(find(:xpath, $admin_lightning_frame)) do
			find(:xpath, $sfl_profile_drop_down).click
			find(:xpath,"//select[@id='Profile']/option[contains(.,'"+mandatory_profile_name+"')]").click
			UTIL.min_wait
			SFL.click_button $sfl_save_button
		end

		puts "I am out from the lightning frame now"
	end

	# to click on alphabate to search user
	def SFL.click_on_alphabet_name_filter alphabet
		find(:xpath,"//div[@class='withFilter']//a/span[contains(.,'"+alphabate+"')]").click
	end

	# setting back the user profile as it was before execution of custom profile change
	# @param profile_name String = name of profile, which has to be assigned back
	def SFL.set_back_profile profile_name, standard_user_full_name
		if(IS_LIGHTNING_ENABLE)
			 SFL.set_back_profile_lightning profile_name, standard_user_full_name
		else
			SFL.set_back_profile_classic profile_name, standard_user_full_name
		end
	end

	# setting back the user profile as it was before execution of custom profile change, in SF classic
	# @param profile_name String = name of profile, which has to be assigned back
	def SFL.set_back_profile_classic profile_name, standard_user_full_name
		SFL.click_setup
		click_link $sfl_manage_user
		UTIL.page_load_waiting
		click_link $sfl_users
		UTIL.page_load_waiting
		if UTIL.verify_xpath_on_page $sfl_xpath_of_user_on_users_page
			puts "yes, user exists on users page"
			find(:xpath,$sfl_xpath_of_user_on_users_page)
			UTIL.min_wait
		else
			puts "no, user doesn't exist on the page"
		end
		find(:xpath,$sfl_xpath_of_edit_button_of_user1).click
		puts "clicked on user name"
		UTIL.min_wait
		find(:xpath,$sfl_profile_drop_down).click
		find(:xpath, "//select[@id='Profile']/option[text()='"+profile_name+"']").click
		UTIL.min_wait
		SFL.click_button $sfl_save_button
		UTIL.min_wait
	 	if page.has_xpath?("//th/a[contains(.,'"+standard_user_full_name+"')]/../following-sibling::td/a[contains(.,'"+profile_name+"')]")
			puts "profile #{profile_name} is assigned back to user now"
		end
	end

	# setting back the user profile as it was before execution of custom profile change, in SF lightning
	# @param profile_name String = name of profile, which has to be assigned back
	def SFL.set_back_profile_lightning profile_name, standard_user_full_name
		find(:xpath, $sfl_global_search_textbox).click
		find(:xpath, $sfl_global_search_textbox).set standard_user_full_name
		UTIL.press_keys_on_page :enter

		find(:xpath, "//tbody//a[contains(.,'"+$standard_user_full_name1_lgt+"')]").click
		find(:xpath, "//li/a[@title='User Detail']").click
		puts "clicked on user detail button"
		UTIL.page_load_waiting

		within_frame(find(:xpath, $admin_lightning_frame)) do
			puts  "I am withing lightning frame"
			find(:xpath, $sflt_edit_button_on_contact).click
			puts "clicked on edit button successfully"
			UTIL.min_wait
		end
		UTIL.page_load_waiting

		within_frame(find(:xpath, $admin_lightning_frame)) do
			find(:xpath, $sfl_profile_drop_down).click
			find(:xpath,"//select[@id='Profile']/option[contains(.,'"+profile_name+"')]").click
			UTIL.min_wait
			SFL.click_button $sfl_save_button
		end
		puts "set back the profile successfully now"
	end

	# unused method
	def SFL.delete_created_order program_name, product_name, order_status
		SFL.open_all_tabs
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl
		CON.open_contact $con_f_name, $con_l_name
		order_name = CON.get_order_name program_name, $con_full_name
		CON.verify_swag_iq_order_status_under_related_list product_name, program_name, order_status
		CON.delete_order order_name
		SFL.alert_ok
		SFL.logout
	end

	# to select an element from lookup
	# @param fieldName String = name of the field which has be selected
	# @param search_value String = search value
	def SFL.select_element_from_lookup fieldName, search_value
		# UTIL.re_execute_script_block do
			find(:xpath, "//*[@alt='"+fieldName+" Lookup (New Window)']").click
			UTIL.min_wait
			within_window(windows.last) do
				UTIL.min_wait
				page.driver.browser.switch_to.frame $sfl_search_frame
				fill_in $sfl_search_frame_input_id, with: search_value
				page.click_button 'Go!'
				UTIL.min_wait
				page.driver.browser.switch_to.default_content
				UTIL.min_wait
				within_frame(find(:xpath, "//frame[contains(@title, 'Results')]")) do
					click_link search_value
					UTIL.min_wait
				end
			end
	 end
end
