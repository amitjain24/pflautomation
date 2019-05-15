# Copyright PFL, All rights reserved.
# Any unauthorized use, copying or sale of the above may constitute an infringement of copyright and may
# result in criminal or other legal proceedings.

module LIC
extend RSpec::Matchers
extend Capybara::DSL

#####################################
# Licenses Page Element locators
#####################################
$licenses_tab = "//a[@href='#licenses']"
$licenses_page_header = "//b[contains(text(),'SwagIQ - Licenses Administration')]"
$save_button = "//a[contains(text(), 'Save')]"
$user_access_type = "//td[contains(@title, 'Dayon Andrade, Rafael')]/..//select[@disabled = 'disabled']"
$used_licenses = "//span[contains(text(), 'Used Licenses')]"
$licenses_settings_icon =  "//section[@id='toggle-settings']"
$licenses_search_text_box = "//input[@placeholder='Search Users by Name, Title, Profile, Role, Country, Region, Cost Center or SwagIQ Admin Access.']"
$licenses_advance_text_box_for_name = "//div/input[@placeholder='Search Users by Name']"
#$license_tab_text = "//span/b[contains(.,'SwagIQ - Licenses Administration')]"
$license_tab_user_list = "//thead/following-sibling::tbody/tr[1]"
$license_advance_search_button = "//a[@id='advanced-search-button']"
$license_clear_button = "//a[contains(.,'Clear')]"
$license_user_not_found_message = "//h1[contains(.,'Users not found.')]"
$license_check_box_checked = "//span[text() = 'Profile']/..//input[(contains(@class, 'ng-not-empty'))]"
$tstMsg = "Searched element found"
$license_all_user_lic_enabled = "//span[contains(@title , 'Enabled')]/..//input[(contains(@class, 'ng-not-empty'))]"
$license_save_button = "//a[@id='savebutton']"
$license_tab_locator = "//a[@href='#licenses']"
$license_used_lic_count = "//span[contains(text(), 'Used Licenses')]/..//span[2]/span"

  # to click on license tab under swagiq tools section
	def LIC.click_licenses_tab
		if(IS_LIGHTNING_ENABLE)
			LIC.click_licenses_tab_lightning
		else
			LIC.click_licenses_tab_classic
		end
	end

	# to click on license tab under swagiq tools section, in  SF lightning
	def LIC.click_licenses_tab_lightning
		within_frame(find(:xpath, $admin_lightning_frame)) do
			LIC.click_licenses_tab_classic
		end
	end

	# to click on license tab under swagIQ tools section, in SF classic
	def LIC.click_licenses_tab_classic
		find(:xpath, $licenses_tab,:visible => true,:wait => 40).click
		logger.info 'Clicked License Tab'
		UTIL.wait_object_appear $licenses_page_header
	end


	# to click on select all checkbox to select all users under license tab, when all users are not selected
	def LIC.enable_license_to_all_user
		if(IS_LIGHTNING_ENABLE)
			LIC.enable_license_to_all_user_lightning
		else
			LIC.enable_license_to_all_user_classic
		end
	end


	def LIC.enable_license_to_all_user_classic
		if(LIC.verify_is_all_user_licensed_enabled)
			puts "All user is already licensed"
		else
			find(:xpath, "//span[contains(@title , 'Enabled')]/..//input[(contains(@class, 'ng-empty'))]/..//span").click
		end
		UTIL.page_load_waiting
	end


	def LIC.enable_license_to_all_user_lightning
		within_frame(find(:xpath, $admin_lightning_frame)) do
			LIC.enable_license_to_all_user_classic
		end
		end


	# to click on select all checkbox to deselect all users under license tab, when all users are selected
	def LIC.disable_license_to_all_user
		if(IS_LIGHTNING_ENABLE)
			LIC.disable_license_to_all_user_on_lightning
		else
		LIC.disable_license_to_all_user_on_classic
		end
	end


	def LIC.disable_license_to_all_user_on_classic
		if(LIC.verify_is_all_user_licensed_enabled)
			find(:xpath, "//span[contains(@title,'Enabled')]/..//input[(contains(@class, 'ng-not-empty'))]/..//span",:visible => true,:wait => 40).click
		else
			logger.info "already All user license Disable"
		end
		UTIL.page_load_waiting
	end


	def LIC.disable_license_to_all_user_on_lightning
		within_frame(find(:xpath, $admin_lightning_frame)) do
			LIC.disable_license_to_all_user_on_classic
		end
	end


	# to verify that select all checkbox is selected on license tab
	def LIC.verify_is_all_user_licensed_enabled
		return page.has_xpath?($license_all_user_lic_enabled)
	end


	# to get the total number of user available on license page
	# @returns total number of available users
	def LIC.get_total_number_user_on_license_page
		if(IS_LIGHTNING_ENABLE)
			LIC.get_total_number_user_on_license_page_on_lightning
		else
			LIC.get_total_number_user_on_license_page_on_classic
		end
	end

	def LIC.get_total_number_user_on_license_page_on_classic
		Array all_user = all(:xpath, "//span[contains(text(), 'Enabled')]/ancestor::table[1]//tbody//tr")
		logger.info "total number of user is #{all_user.size}"
		return all_user.size
	end

	def LIC.get_total_number_user_on_license_page_on_lightning
		within_frame(find(:xpath, $admin_lightning_frame)) do
			LIC.get_total_number_user_on_license_page_on_classic
		end
	end


	# to get total number of licensed user count, available on license page
	# @returns total number of licensed users on the license page

	def LIC.get_total_number_displaying_licensed_user
		if(IS_LIGHTNING_ENABLE)
			LIC.get_total_number_displaying_licensed_user_on_lightning
		else
			LIC.get_total_number_displaying_licensed_user_on_classic
		end
	end


	def LIC.get_total_number_displaying_licensed_user_on_classic
		Array lic_user = all(:xpath, "//span[contains(text(), 'Enabled')]/ancestor::table[1]//tbody//tr//input[(contains(@class, 'ng-not-empty'))]")
		logger.info "total number of licensed user is #{lic_user.size}"
		return lic_user.size
	end


	def LIC.get_total_number_displaying_licensed_user_on_lightning
		within_frame(find(:xpath, $admin_lightning_frame)) do
			LIC.get_total_number_displaying_licensed_user_on_classic
		end
	end


	# to remove license for a user, from license tab
	# param user_name = name of the user, which has to be  unlicensed
	def LIC.remove_license_to_user user_name
		if(IS_LIGHTNING_ENABLE)
			 LIC.remove_license_to_user_lightning user_name
		else
			LIC.remove_license_to_user_classic user_name
		end
	end


	# to remove license for a user, from license tab
	# param user_name = name of the user, which has to be  unlicensed
	def LIC.remove_license_to_user_classic user_name
		if(LIC.verify_is_user_licensed user_name)
			UTIL.re_execute_script_block do
				find(:xpath, "(//td[contains(text(),'"+user_name+"')]/..//span)[1]",:visible => true,:wait => 40).click
			end
			UTIL.wait_object_appear $save_button
		end
	end


	# to remove license for a user, from license tab
	# param user_name = name of the user, which has to be  unlicensed
	def LIC.remove_license_to_user_lightning user_name
		within_frame(find(:xpath, $admin_lightning_frame)) do
			LIC.remove_license_to_user_classic user_name
		end
	end


	# to verify if a user is licensed
	# @returns true if user is licensed, else false
	def LIC.verify_is_user_licensed user_name
		page.has_xpath?("//td[contains(@title, '"+user_name+"')]/..//input[(contains(@class, 'ng-not-empty'))]")
	end


	# to verify license header on license tab
	def LIC.verify_licenses_page_header
		if(IS_LIGHTNING_ENABLE)
			LIC.verify_licenses_page_header_lightning
		else
			LIC.verify_licenses_page_header_classic
		end
	end


	# to verify license header on license tab
	def LIC.verify_licenses_page_header_lightning
		within_frame(find(:xpath, $admin_lightning_frame)) do
			LIC.verify_licenses_page_header_classic
		end
	end


	# to verify license header on license tab
	def LIC.verify_licenses_page_header_classic
		UTIL.page_load_waiting
		status = page.has_xpath?($licenses_page_header)
		logger.info "Verify Licenses page header : #{status}"
		return status
	end


	# to assign license to a user on license page
	def LIC.assign_license_to_user user_name
		if(IS_LIGHTNING_ENABLE)
			LIC.assign_license_to_user_lightning user_name
		else
			LIC.assign_license_to_user_classic user_name
		end
	end


	# to assign license to a user on license page, in SF classic
	def LIC.assign_license_to_user_classic user_name
		UTIL.re_execute_script_block do
			find(:xpath, "(//td[contains(text(),'"+user_name+"')]/..//span)[1]",:visible => true,:wait => 40).click
		end
		UTIL.wait_object_appear $save_button
	end

	# to assign license to a user on license page, in SF lightning
	def LIC.assign_license_to_user_lightning user_name
		within_frame(find(:xpath, $admin_lightning_frame)) do
			LIC.assign_license_to_user_classic user_name
		end
	end

	# to verify the count of modified users on license page
	# @param modifier_users_count = count to the  modified users, affected by the licensing/unlicensed
	def LIC.verify_modified_users_label_and_count_exists modifier_users_count
		if(IS_LIGHTNING_ENABLE)
			LIC.verify_modified_users_label_and_count_exists_lightning modifier_users_count
		else
			LIC.verify_modified_users_label_and_count_exists_classic modifier_users_count
		end
	end

	# to verify the count of modified users on license page, in SF lightning
	# @param modifier_users_count = count to the  modified users, affected by the licensing/unlicensed
	def LIC.verify_modified_users_label_and_count_exists_lightning modifier_users_count
		within_frame(find(:xpath, $admin_lightning_frame)) do
			LIC.verify_modified_users_label_and_count_exists_classic modifier_users_count
		end
	end

	# to verify the count of modified users on license page, in SF classic
	# @param modifier_users_count = count to the  modified users, affected by the licensing/unlicensed
	def LIC.verify_modified_users_label_and_count_exists_classic modifier_users_count
		UTIL.min_wait
		UTIL.page_load_waiting
		status = page.has_xpath?("//span[contains(text(), 'Modified Users')]/..//span[2]//span[contains(text(), '"+modifier_users_count+"')]")
		logger.info "Modified Users label exists : #{status}"
	end

	# to click on save button, after making any change in user, on license page
	def LIC.click_save_button
		if(IS_LIGHTNING_ENABLE)
			 LIC.click_save_button_lightning
		else
			LIC.click_save_button_classic
		end
	end

	# to click on save button, after making any change in user, on license page, in SF classic
	def LIC.click_save_button_classic
		UTIL.scroll_to  $license_save_button
		find(:xpath, $license_save_button).click
		UTIL.wait_object_appear $used_licenses
	end

	# to click on save button, after making any change in user, on license page, in SF lightning
	def LIC.click_save_button_lightning
		within_frame(find(:xpath, $admin_lightning_frame)) do
			LIC.click_save_button_classic
		end
	end

	# to verify that used license count is increased by 1, on license page
	# @param increased_user_count = increased count of the user
	def LIC.verify_used_license_count_increase_by_1 increased_user_count
		UTIL.min_wait
		UTIL.page_load_waiting
		status = page.has_xpath?("//span[contains(text(), 'Used Licenses')]/..//span[2]//span[contains(text(), '"+increased_user_count+"')]")
		logger.info "User count has increased by 1 : #{status}"
	end

	# to verify that user has "user" type access, assigned successfully
	# @param user_name = name of the user for whom we are trying to verify the access level
	def LIC.verify_licensed_user_has_user_access_assigned user_name
		UTIL.min_wait
		UTIL.page_load_waiting
		status = page.has_xpath?("//td[contains(@title, '"+user_name+"')]/..//select[@disabled = 'disabled']")
		logger.info "Is User not assigned license (true=not assigned, false=assigned): #{status}"
	end

	# to verify that checkbox for license is selected/checked for a user
	# @param user_name = name of the user for whom we are trying to verify the license
		def LIC.verify_license_checkbox_checked user_name
		if(IS_LIGHTNING_ENABLE)
			LIC.verify_license_checkbox_checked_lightning user_name
		else
			LIC.verify_license_checkbox_checked_classic user_name
		end
	end

	# to verify that checkbox for license is selected/checked for a user, in SF classic
	# @param user_name = name of the user for whom we are trying to verify the license
	def LIC.verify_license_checkbox_checked_classic user_name
		UTIL.min_wait
		UTIL.page_load_waiting
		status = page.has_xpath?("//td[contains(@title, '"+user_name+"')]/..//input[(contains(@class, 'ng-not-empty'))]")
		logger.info "Is License check box checked for the user: #{status}"
	end

	# to verify that checkbox for license is selected/checked for a user, in SF lightning
	# @param user_name = name of the user for whom we are trying to verify the license
	def LIC.verify_license_checkbox_checked_lightning user_name
		within_frame(find(:xpath, $admin_lightning_frame)) do
			LIC.verify_license_checkbox_checked_classic user_name
		end
	end

	# to verify the various tooltip text on license page
	def LIC.verify_licenses_page_tool_tips
		UTIL.min_wait
		UTIL.page_load_waiting
		status = page.has_xpath?("//span [@title='Enabled']")
		logger.info "Tooltip for column ENABLED is Enabled: #{status}"

		status = page.has_xpath?("//span [@title='Name']")
		logger.info "Tooltip for column NAME is Name: #{status}"

		status = page.has_xpath?("//span [@title='title']")
		logger.info "Tooltip for column TITLE is title: #{status}"

		status = page.has_xpath?("//span [@title='Profile']")
		logger.info "Tooltip for column PROFILE is Profile: #{status}"

		status = page.has_xpath?("//span [@title='Role']")
		logger.info "Tooltip for column ROLE is Role: #{status}"

		status = page.has_xpath?("//span [@title='Country']")
		logger.info "Tooltip for column COUNTRY is Country: #{status}"

		status = page.has_xpath?("//span [@title='Region']")
		logger.info "Tooltip for column REGION is Region: #{status}"

		status = page.has_xpath?("//span [@title='Cost Center']")
		logger.info "Tooltip for column COST CENTER is Cost Center: #{status}"

		status = page.has_xpath?("//span [@title='SwagIQ Admin Access']")
		logger.info "Tooltip for column SWAGIQ ADMIN ACCESS is SwagIQ Admin Access: #{status}"
	end

	# to get the licensed user count
	def LIC.get_licensed_users_value
		if(IS_LIGHTNING_ENABLE)
			 LIC.get_licensed_users_value_lightning
		else
			LIC.get_licensed_users_value_classic
		end
	end

	# to get the licensed user count
	# returns count of the licensed users
	def LIC.get_licensed_users_value_classic
		lic_user_value_count = find(:xpath, $license_used_lic_count).text
		logger.info "value of licenesed users before assignment is #{lic_user_value_count}"
		return lic_user_value_count.to_i
	end

	# to get the licensed user count
	def LIC.get_licensed_users_value_lightning
		within_frame(find(:xpath, $admin_lightning_frame)) do
			LIC.get_licensed_users_value_classic
		end
	end

	# to get the license count difference before and after assignment
	# @param license_count_after_assignment String = license count before assignment
	# @param license_count_before_assignment String = license count after assignment
	def LIC.get_license_count_difference license_count_after_assignment, license_count_before_assignment
		final_license_count = license_count_after_assignment - license_count_before_assignment
		logger.info "difference of license count before and after assignment is #{final_license_count}"
	end

	# to verify the text of search bar on license page
	def LIC.verify_license_tab_search_text_box
		if(IS_LIGHTNING_ENABLE)
			 LIC.verify_license_tab_search_text_box_lightning
		else
			LIC.verify_license_tab_search_text_box_classic
		end
	end

	# to verify the text of search bar on license page, in SF classic
	def LIC.verify_license_tab_search_text_box_classic
		status = page.has_xpath?($licenses_search_text_box)
		logger.info "search text box is available on license page #{status}"
		return status
	end

	# to verify the text of search bar on license page, in SF lightning
	def LIC.verify_license_tab_search_text_box_lightning
		within_frame(find(:xpath, $admin_lightning_frame)) do
			LIC.verify_license_tab_search_text_box_classic
		end
	end

	# to wait for page load
	def LIC.page_load_waiting
		begin
			page.has_xpath?($license_tab_user_list)
		rescue
			UTIL.min_wait
		end
	end

	# to perform the search by given criteria
	# @param search_criteria String = value of the criteria type (role, name, country etc)
	def LIC.perform_search_by search_criteria
		if(IS_LIGHTNING_ENABLE)
			 LIC.perform_search_by_lightning search_criteria
		else
			LIC.perform_search_by_classic search_criteria
		end
	end

	# to perform the search by given criteria
	# @param search_criteria String = value of the criteria type (role, name, country etc)
	def LIC.perform_search_by_lightning search_criteria
		within_frame(find(:xpath, $admin_lightning_frame)) do
			LIC.perform_search_by_classic search_criteria
		end
	end

	# to perform the search by given criteria
	# @param search_criteria String = value of the criteria type (role, name, country etc)
	def LIC.perform_search_by_classic search_criteria
		UTIL.min_wait
		find(:xpath,$licenses_search_text_box).set search_criteria
		return page.has_xpath?("(//tbody/tr/td[contains(@title,'"+search_criteria+"')])[1]")
		find(:xpath,$licenses_search_text_box).set ' '
		UTIL.min_wait
	end

	# to make the search box empty
	def LIC.make_search_box_empty
		UTIL.min_wait
		find(:xpath,$licenses_search_text_box).set ' '
		UTIL.page_load_waiting
		UTIL.min_wait
	end

	# to click on settings icon for advance search, on license page
	def LIC.click_settings_icon
		if(IS_LIGHTNING_ENABLE)
			 LIC.click_settings_icon_lightning
		else
			LIC.click_settings_icon_classic
		end
	end

	# to click on settings icon for advance search, on license page, in SF lightning
	def LIC.click_settings_icon_lightning
		within_frame(find(:xpath, $admin_lightning_frame)) do
			LIC.click_settings_icon_classic
		end
	end

	# to click on settings icon for advance search, on license page, in SF classic
	def LIC.click_settings_icon_classic
		find(:xpath,$licenses_settings_icon).click
		UTIL.min_wait
	end

	# to perform advance search on license page, by using criteria, placeholder of text box, and checkbox name
	# @param search_criteria String = value of the criteria type (role, name, country etc)
	# @placeholder_value =  text of the placeholder being passed
	# @checkbox_name = name of the checkbox for criteria
	# @returns true if search criteria exists, else false
	def LIC.perform_advance_search_by search_criteria, placeholder_value, checkbox_name
		if(IS_LIGHTNING_ENABLE)
			 LIC.perform_advance_search_by_lightning search_criteria, placeholder_value, checkbox_name
		else
			LIC.perform_advance_search_by_classic search_criteria, placeholder_value, checkbox_name
		end
	end

	# to perform advance search on license page, by using criteria, placeholder of text box, and checkbox name, in SF lightinng
	# @param search_criteria String = value of the criteria type (role, name, country etc)
	# @placeholder_value =  text of the placeholder being passed
	# @checkbox_name = name of the checkbox for criteria
	# @returns true if search criteria exists, else false
	def LIC.perform_advance_search_by_lightning search_criteria, placeholder_value, checkbox_name
		within_frame(find(:xpath, $admin_lightning_frame)) do
			LIC.perform_advance_search_by_classic search_criteria, placeholder_value, checkbox_name
		end
	end

	# to perform advance search on license page, by using criteria, placeholder of text box, and checkbox name, in SF classic
	# @param search_criteria String = value of the criteria type (role, name, country etc)
	# @placeholder_value String  =  text of the placeholder being passed
	# @checkbox_name String = name of the checkbox for criteria
	# @returns true if search criteria exists, else false
	def LIC.perform_advance_search_by_classic search_criteria, placeholder_value, checkbox_name
		UTIL.min_wait
		find(:xpath,"//input[@placeholder='"+placeholder_value+"']").set search_criteria
		UTIL.page_load_waiting
		chk_box_name = checkbox_name
		assert_status = LIC.advance_search_checkbox_checked chk_box_name
		logger.info "Verify that advanced search checkbox '"+chk_box_name+"' is checked  : #{assert_status}"
		# assert_values_and_report_result true, assert_status, $tstMsg
		find(:xpath,$license_advance_search_button).click

		return page.has_xpath?("(//tbody/tr/td[contains(@title,'"+search_criteria+"')])[1]")
	UTIL.page_load_waiting
	end

	# to verify if advance search checkbox is checked
	def LIC.advance_search_checkbox_checked checkbox_name
		return page.has_xpath?("//span[text() = '"+checkbox_name+"']/..//input[(contains(@class, 'ng-not-empty'))]")
	end

	# to click on clear button to reset the advance search filter
	def LIC.click_clear_button
		if(IS_LIGHTNING_ENABLE)
			LIC.click_clear_button_lightning
		else
			LIC.click_clear_button_classic
		end
	end

	# to click on clear button to reset the advance search filter, in SF lightning
	def LIC.click_clear_button_lightning
		within_frame(find(:xpath, $admin_lightning_frame)) do
			LIC.click_clear_button_classic
		end
	end

	# to click on clear button to reset the advance search filter, in SF classic
	def LIC.click_clear_button_classic
		find(:xpath,$license_clear_button).click
		UTIL.min_wait
	end

	# to enable license for a user
	# @param username String = name of the user for whom you want to enable the licenses
	def LIC.enable_license_to_user username
		find(:xpath, "//td[@title='"+username+"']/../td//input[@type='checkbox']")
	end

	# to assert the tab on license page
	# @param tab_name String = name of the tab, you want to assert
	def LIC.expect_tab tab_name
		if(IS_LIGHTNING_ENABLE)
			 LIC.expect_tab_lightning tab_name
		else
			LIC.expect_tab_classic tab_name
		end
	end

	# to assert the tab on license page, in SF classic
	# @param tab_name String = name of the tab, you want to assert
	def LIC.expect_tab_classic tab_name
		UTIL.min_wait
		expect(page).to have_xpath(tab_name)
	end

	# to assert the tab on license page, in SF lightning
	# @param tab_name String = name of the tab, you want to assert
	def LIC.expect_tab_lightning tab_name
		within_frame(find(:xpath, $admin_lightning_frame)) do
			LIC.expect_tab_classic tab_name
		end
	end

	# to assert the columns of license page
	# @param column_name String = name of the column, you want to assert
	def LIC.assert_columns_on_license_page column_name
		if(IS_LIGHTNING_ENABLE)
			LIC.assert_columns_on_license_page_lightning column_name
		else
			LIC.assert_columns_on_license_page_classic column_name
		end
	end

	# to assert the columns of license page
	# @param column_name String = name of the column, you want to assert
	def LIC.assert_columns_on_license_page_lightning column_name
		within_frame(find(:xpath, $admin_lightning_frame)) do
			LIC.assert_columns_on_license_page_classic column_name
		end
	end

	# to assert the columns of license page
	# @param column_name String = name of the column, you want to assert
	def LIC.assert_columns_on_license_page_classic column_name
		UTIL.min_wait
		return page.has_xpath?("//span[@title = '"+column_name+"']")
	end
end
