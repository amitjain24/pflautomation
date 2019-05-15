# Copyright PFL, All rights reserved.
# Any unauthorized use, copying or sale of the above may constitute an infringement of copyright and may
# result in criminal or other legal proceedings.

module LICENSE
extend RSpec::Matchers
extend Capybara::DSL

#####################################
# Licenses Page Element locators
##########################################
$licenses_settings_icon =  "//section[@id='toggle-settings']"
$licenses_search_text_box = "//input[@placeholder='Search Users by Name, Title, Profile, Role, Country, Region, Cost Center or SwagIQ Admin Access.']"
$licenses_advance_text_box_for_name = "//div/input[@placeholder='Search Users by Name']"
#$license_tab = "//a[@href='#licenses']"
$license_tab_text = "//span/b[contains(.,'SwagIQ - Licenses Administration')]"
$license_tab_user_list = "//thead/following-sibling::tbody/tr[1]"
$license_advance_search_button = "//a[@id='advanced-search-button']"
$license_clear_button = "//a[contains(.,'Clear')]"
$license_user_not_found_message = "//h1[contains(.,'Users not found.')]"
$license_check_box_checked = "//span[text() = 'Profile']/..//input[(contains(@class, 'ng-not-empty'))]"

	# unused method
	def LICENSE.verify_license_tab_text
		a = page.has_xpath?($license_tab_text)
		puts "License tab appears : #{a}"
	end

	# unused method
	def LICENSE.click_on_license_tab
		find(:xpath,$license_tab).click
	end

	# unused method
	def LICENSE.verify_license_tab_search_text_box
		a= page.has_xpath?($licenses_search_text_box)
		puts "search text box is available on license page #{a}"
	end

	# unused method
	def LICENSE.page_load_waiting
		begin
			page.has_xpath?($license_tab_user_list)
		rescue
			UTIL.min_wait
		end
	end

	# unused method
	def LICENSE.perform_search_by search_criteria
		LICENSE.page_load_waiting
		find(:xpath,$licenses_search_text_box).set search_criteria
		if a = page.has_xpath?("(//tbody/tr/td[contains(@title,'"+search_criteria+"')])[1]")
			puts "result for simple search #{search_criteria} is available on the page:  #{a}"
			sleep 2
		else
			puts "result for simple search #{search_criteria} is not available on the page"
		end
		find(:xpath,$licenses_search_text_box).set ''
		sleep 2
	end

	# unused method
	def LICENSE.click_settings_icon
		find(:xpath,$licenses_settings_icon).click
		sleep 3
	end

	# unused method
	def LICENSE.perform_advance_search_by search_criteria, placeholder_value, checkbox_name
		find(:xpath,"//input[@placeholder='"+placeholder_value+"']").set search_criteria
		sleep 2
		find(:xpath,$license_advance_search_button).click
		if a = page.has_xpath?("(//tbody/tr/td[contains(@title,'"+search_criteria+"')])[1]")
			puts "result for search criteria '#{checkbox_name}' is available on the page:  #{a}"
			sleep 2
		elsif b =  page.has_xpath?($license_user_not_found_message)
			puts "result for search criteria '#{checkbox_name}' is not available on the page"
		end
		if page.has_xpath?("//span[text() = '"+checkbox_name+"']/..//input[(contains(@class, 'ng-not-empty'))]")
			puts "checkbox for #{checkbox_name} is checked"
		else
			puts "checkbox for #{checkbox_name} is not checked"
		end
	end

	# unused method
	def LICENSE.click_clear_button
		find(:xpath,$license_clear_button).click
	end

	# unused method
	def LICENSE.assert_columns_on_license_page column_name
		if a = page.has_xpath?("//span[@title = '"+column_name+"']")
			puts "column #{column_name} appears on license page : #{a}"
		else
			puts "column #{column_name} doesn't appear on license page"
		end
	end
end
