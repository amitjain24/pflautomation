# Copyright PFL, All rights reserved.
# Any unauthorized use, copying or sale of the above may constitute an infringement of copyright and may
# Result in criminal or other legal proceedings.

module ADMIN
extend RSpec::Matchers
extend Capybara::DSL

##########################################
# Administration Page Element locators
##########################################
$admin_swag_tools_tab = "//a[contains(@title,'SwagIQ Tools')]"
$admin_program_admin_tile = "//div[@title='Program Administration']/ancestor::div[2]"
$admin_user_admin_tile = "//div[@title='User Administration']/ancestor::div[2]"
$admin_product_admin_tile = "//div[@title='Product Administration']/ancestor::div[2]"
$admin_user_admin_tile_li_add_edit_users = "Add and edit users"
$admin_user_admin_tile_li_activate_inactivate_users = "Activate and inactivate users"
$admin_budget_quantity_value = "//label[contains(text(),'Available Budget (Qty/$)')]/ancestor::div[1]//p/span"
$admin_product_admin_tile_li_view_product = "View products"
$admin_product_admin_tile_li_edit_product_budget = "Edit product budget amounts"
$admin_product_admin_tile_li_activate_inactivate_product = "Activate and inactivate products"
$admin_program_admin_tile_li_view_program = "View programs"
$admin_program_admin_tile_li_create_edit_programs = "Create and edit programs"
$admin_new_program_button = "//button[@title = 'New Program']"
$admin_program_admin_page_title = "//h3[contains(text(), 'Program Administration')]"
$admin_program_details_title = "//h3[contains(text(), 'Program Details')]"
$admin_program_ok_button = "//div[@class='modal-footer']/button[contains(text(),'OK')]"
$admin_program_cancel_button = "//div[@class='modal-footer']/button[contains(text(), 'Cancel')]"
$admin_program_search_bar = "//input[@placeholder='Search Programs']"
$admin_product_search_bar = "//input[@placeholder='Search Products']"
$admin_user_search_bar = "//input[@placeholder='Search Users']"
$admin_program_name_column = "//th[@title='Name']/span"
$admin_bd_auto_program_1_column = "//th[@title='Name']/span"
$admin_program_product_column = "//th[@title='Product']/span"
$admin_program_campaign_name_column = "//th[@title='Campaign Name']/span"
$admin_program_budget_column = "//th[@title='Total Budget']/span"
$admin_program_created_column = "//th[@title='Created']/span"
$admin_program_updated_column = "//th[@title='Updated']/span"
$admin_program_active_column = "//th[@title='Active']/span"
$admin_add_program_product = "//button[contains(text(),'Add Program Product')]"
$admin_add_Users_button = "//a[contains(@title, 'Add Users')]"
$admin_label_remove_product_id = "//Button[contains(text(),'Remove Product')]"
$admin_program_label_product_value = "//label[contains(text(),'Product Value')]"
$admin_program_label_availablebudget_qty = "//label[contains(text(),'Available Budget (Qty/$admin_)')]"
$admin_program_label_campaign_lookup = "//label[contains(text(),'Campaign Lookup')]"
$admin_program_label_campaign_id = "//label[contains(text(),'Campaign ID')]"
$admin_program_label_campaign_name = "//label[contains(text(),'Campaign Name')]"
$admin_program_label_campaign_memeber_status = "//label[contains(text(),'Campaign Member Status')]"
$admin_program_label_assignment_type = "//label[contains(text(),'Assignment Type')]"
$admin_searchbar_on_users_page = "//input[@id='inputSearch']"
$admin_user_search_checkbox = "//td[@class='userlist-checkbox-cell col-1']/input"
$admin_add_user_button_on_users_page = "//span[@class='input-group-btn']/button/i" #{# review it}
$admin_add_users_confirm_button_ok = "//button[contains(text(),'Ok') or contains(text(),'Yes')]"
$admin_add_users_confirm_button_yes = "//button[contains(text(),'Yes')]"
$admin_active_program_toggle =  "//span[@class='fa fa-lg fa-toggle-off']"
$admin_program_header =  "//a[contains(text(),'Programs')]"
$admin_program_activated_status =  "//span[contains(@class, 'toggle-on text-success')]"
$admin_program_inactivated_status =  "//span[contains(@class, 'fa fa-lg fa-toggle-off')]"
$admin_program_first_name_title = "//span[contains(text(), 'First Name')]"
$admin_program_search_bar_text = "//input[@placeholder = 'Search Programs']"
$admin_program_search_user = "//input[@placeholder = 'Search Users']"
$admin_program_role_name = "//input[contains(@placeholder, 'Role Name')]"
$admin_program_add_role_button = "//button[contains(text(), 'Add Role')]"
$admin_campaign_status_sent = "Sent"
$admin_user_first_name = "First Name"
$admin_user_Last_name = "Last Name"
$admin_user_title = "Title"
$admin_user_email = "Email"
$admin_user_role = "Role"
$admin_user_profile = "Profile"
$admin_user_cost_center = "Cost Center"
$admin_user_country = "Country"
$admin_user_type = "User Type"
$admin_product_budgeted = "Budgeted"
$admin_product_allocated = "Allocated"
$admin_product_active = "Active"
$admin_bd_auto_product_1 = "PFL_Auto_Product1"
$admin_bd_auto_product_2 = "PFL_Auto_Product2"
$admin_bd_auto_product_3 = "PFL_Auto_Product3"
$admin_bd_auto_program_1 = "PFL_Auto_Program1"
$admin_bd_campaign_name = "PFL_auto_Test_campaign"
$admin_bd_campaign_status_sent = "Sent"
$admin_user_budget_quantity = "(//td[contains(@title,'Available Quantity')]//p)[1]"
$admin_inactive_program_toggle = "//span[contains(@class,'fa fa-lg fa-toggle-on')]"
$admin_program_assignment_type_user = "//div/label[contains(text(),'Assignment Type')]/..//div//p[contains(.,'User')]"
$admin_program_budget_distributed = "//label[contains(text(),'Budget Allocation')]/../div//p[contains(.,'Distributed')]"
$admin_user_budget_quantity_text = "//input[@placeholder='Quantity']"
$admin_pfl_bd_auto_user_email = "deepak.sharma1@metacube.com"
$admin_swagiq_tools_error_msg = "//h3[contains(text(),'You are not authorized to view that resource.')]"
$admin_user_detail = "//td[contains(@title,'Tech Master')]"
$admin_user_remove_button = "//button[contains(text(),'Remove')]"
$admin_user_remove_confirmation_popup = "//h4[contains(.,'Remove User?')]"
$admin_user_admin_page_title = "//h3[contains(text(), 'User Administration')]"
$admin_add_user_button_on_users_admin_page = "//a[contains(@title,'Add Users')]"
$admin_select_checkbox_user = "(//input[contains(@type,'checkbox')])[3]"
$admin_add_user_button_for_adding_user = "//button[contains(.,'Add 1 Users')]"
$admin_user_add_confirmation_popup = "//h4[contains(text(),'Add Users?')]"
$admin_pfl_bd_auto_user_first_name = "PFL_Auto"
$admin_pfl_bd_auto_user_last_name = "Standard_User"
$admin_pfl_bd_auto_user_profile = "Standard User"
$admin_pfl_bd_auto_user_access_level = "Admin"
$admin_pfl_bd_auto_user_role = "Marketing Manager"
$admin_user_advance_search_first_name_id = "advSearch_firstName"
$admin_user_advance_search_role_id = "advSearch_role"
$admin_user_advance_search_last_name_id = "advSearch_lastName"
$admin_user_advance_search_profile_id = "advSearch_profile"
$admin_search_email = "(//input[@id='advSearch_title'])[2]"
$admin_search_admin_access_level = "//option[contains(text(),'Admin')]"
$admin_advance_search_button = "//button[contains(text(),'Advanced')]"
$admin_advance_search_Tile = "//h3[contains(text(),'Advanced Search')]"
$admin_budget_allocation_shared = "Shared"
$admin_program_budget_shared = "//label[contains(text(),'Budget Allocation')]/../div//p[contains(.,'Shared')]"
$admin_program_assignment_type_user = "//div/label[contains(text(),'Assignment Type')]/..//div//p[contains(.,'User')]"
$admin_lightning_frame = "//div[contains(@class, 'oneAlohaPage')]//iframe"
$admin_product_display_label = "//div/strong[contains(.,'Display Name')]"
$admin_product_display_label2 = "//strong[contains(.,'Display as: ')]"
$admin_product_budget_exceed_msg = "Program budget exceeds product budget"
$admin_user_budget_exceed_msg = "User budget exceeds program budget"
$admin_tool_page_load_error = "//h3[contains(.,'An unknown error has occurred.')]"
$admin_swagiq_tools_tab = "//a[@title='SwagIQ Tools Tab - Selected']"
$admin_program_data_table =  "(//table[@class='table table-bordered table-hover'])[2]"
$admin_pfl_bd_amit_user = "Amit"
$admin_user_access_type = "//button[contains(text(),'Admin')]"
$admin_standard_user_access_type = "//a[contains(text(),'Standard User')]"
$admin_user_save_button_on_store = "//button[contains(text(),'Save') and @ng-disabled = '!adminUserListRowEditCtrl.form.$dirty']"
$admin_standard_user_access_type = "//a[contains(text(),'Standard User')]"
$admin_user_save_button_on_store = "//button[contains(text(),'Save') and @ng-disabled = '!adminUserListRowEditCtrl.form.$dirty']"
$admin_activate_product_toggle = "//span[@class='fa fa-lg fa-toggle-off']"
$admin_deactivate_product_toggle = "//span[@class='fa fa-lg text-success fa-toggle-on']"
#$admin_product_save_button = "//label[contains(text(), 'Programs')]/..//button[contains(text(),'Save')]"
$admin_product_save_button = "//button[@class='btn btn-primary']"
$admin_program_page_product_unavailable_text = "//i[@uib-tooltip='Selected product is disabled, the program can not be activated with disabled products']"
$admin_program_page_product_xpath_after_selection = "//div/p[contains(.,'PFL_Auto_Product4')]"
$admin_product_unallocated_qty = "//label[contains(.,'Unallocated ')]/./following-sibling::p"
$admin_available_product_qty = "//label[contains(text(),'Available Budget (Qty/$)')]/ancestor::div[1]//p"
$admin_budget_allocation_label = "//label[contains(.,'Budget Allocation')]"
$admin_budget_allocation_field = "//label[contains(text(),'Budget Allocation')]/..//i"
$admin_standard_user_type_dropdown = "//div[@id ='accessLevel']"
$admin_user_type_dropdown = "//a[@href='#'][contains(.,'Admin')]"
$admin_select_all_checkbox_add_user = "//input[@id='ckBxAll']"
$admin_role_value_drop_down = "//div[@class='input-with-status']//ul[@class='dropdown-menu ng-isolate-scope ng-hide']"
$admin_add_user_button_on_program_page = "//button[contains(text(),'Add Users')]"
	
	#########################################
	# Contact object setter and getter methods
	##########################################

	# to click on new program button in SF classic version
	def ADMIN.click_new_program_classic_button
	  within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
					click_on('New Program')
					if(!page.has_xpath?"//input[@placeholder='New Program Name']")
						click_on('New Program')
					end
					#click_on('New Program')
			 		#find(:xpath, $admin_new_program_button,:visible => true,:wait => 60).click
			 		logger.info 'Clicked on New Program Button'
					UTIL.wait_object_appear $admin_program_cancel_button
			end
		end
	end

	# to click on new program button within program list section
	def ADMIN.click_new_program_button
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_new_program_lightning_button
		else
			ADMIN.click_new_program_classic_button
		end
	end

	# to click on new program button in SF lightning version
	def ADMIN.click_new_program_lightning_button
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_new_program_classic_button
		end
	end

	##############################################
	# Lightning methods
	##############################################
	# to wait for given object in SF lightning version
	# @param variable_path String = xpath of the object, which you want to wait for
	def ADMIN.wait_object_load variable_path
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				UTIL.wait_object_appear variable_path
			end
		end
	end

	# to click on program admin tile available in administration section for SF lightning version
	def ADMIN.click_lightning_program_admin_tile
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_classic_program_admin_tile
		end
	end

	# to click on product admin tile available in administration section for SF lightning version
	def ADMIN.click_on_lightning_product_tile
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_on_classic_product_tile
		end
	end

	# to click on user admin tile available in administration section for SF lightning version
	def ADMIN.click_on_lightning_user_tile
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_on_classic_user_tile
		end
	end

	# to assert an element on administration page in SF lightning version
	# @param element_locator = xpath of the element, you want to assert
	def ADMIN.assert_element_on_lightning_administration_page element_locator
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.assert_element_on_classic_administration_page element_locator
		end
	end

	# to assert a tile(block) and its available elements on administration page in SF lightning version
	# @param tile = xpath of the tile, that contains the list of the items
	# @param list_element = xpath of the list which contains some items
	def ADMIN.assert_element_under_lightning_administration_page_tile tile, list_element
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.assert_element_under_classic_administration_page_tile tile, list_element
		end
	end

	# to assert an element using its label in SF lightning version
	# @param element_label = xpath of the label of the element, you want to assert
	def ADMIN.assert_element_using_label_on_lightning_administration_page element_label
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.assert_element_using_label_on_classic_administration_page element_label
		end
	end

	#######################################
	# Classic version
	########################################

	# to click on program admin tile available in administration section for SF classic version
	def ADMIN.click_classic_program_admin_tile
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				UTIL.scroll_to $admin_program_admin_tile
				UTIL.re_execute_script_block do
					find(:xpath, $admin_program_admin_tile,visible:true, :wait => 60).click
					logger.info 'Clicked on Admin Tile'
				end	
				UTIL.scroll_to $admin_new_program_button
				#UTIL.wait_object_appear $admin_new_program_button
			end
		end
	end

	# to click on product tile available in administration section for SF classic version
	def ADMIN.click_on_classic_product_tile
		ADMIN.wait_object_load $admin_product_admin_tile
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.re_execute_script_block do
					find(:xpath, $admin_product_admin_tile,:visible => true,:wait => 40).click
				end	
			end
		end
	end

	# to click on user tile available in administration section for SF classic version
	def ADMIN.click_on_classic_user_tile
		ADMIN.wait_object_load $admin_user_admin_tile
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.re_execute_script_block do
					find(:xpath, $admin_user_admin_tile,:visible => true,:wait => 40).click
					logger.info 'Clicked on User Tile'
				end	
			end
		end
	end

	# to verify the error message in administration section while loading administration tab for SF classic version
	def ADMIN.verify_error_message_on_page_load
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				if(page.has_xpath($admin_tool_page_load_error))
					CON.click_on_element $admin_swagiq_tools_tab
				else
				puts "page is loaded"
				end
			end
		end
	end

	# to assert an element on administration page for SF classic version
	# @param element_locator String = xpath of the element, you want to assert
	# returns the element locator to one more method which verifies the locator on the page
	def ADMIN.assert_element_on_classic_administration_page element_locator
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				return UTIL.verify_locator_on_page element_locator
			end
		end
	end

	# to assert the list of elements within a tile available on administration page for SF classic version
	# @param tile String = xpath of the tile, that contains the list of the items
	# @param list_element String = xpath of the list which contains some items
	# returns boolean value true if element exists on the page, else returns false
	def ADMIN.assert_element_under_classic_administration_page_tile tile, list_element
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				within(find(:xpath, tile))do
					return page.has_xpath? "//li[contains(text(), '"+list_element+"')]"

				end
			end
		end
	end

	# to assert an element using its label in SF classic version
	# @param element_label String = xpath of the label of the element, you want to assert
	# returns boolean value true if element exists on the page, else returns false
	def ADMIN.assert_element_using_label_on_classic_administration_page element_label
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				return page.has_xpath? ("//span[contains(text(), '"+element_label+"')]")

			end
		end
	end

	# to click on program admin tile
	def ADMIN.click_program_admin_tile
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_lightning_program_admin_tile
		else
			ADMIN.click_classic_program_admin_tile
		end
	end

	# to click on product tile
	def ADMIN.click_on_product_tile
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_on_lightning_product_tile
		else
			ADMIN.click_on_classic_product_tile
		end
	end

	# to click on user tile
	def ADMIN.click_on_user_tile
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_on_lightning_user_tile
		else
			ADMIN.click_on_classic_user_tile
		end
	end


	# to assert an element on administration page in SF classic version
	# @param element_locator String = Pass element locator in form of Xpath
	def ADMIN.assert_element_on_administration_page element_locator
		if(IS_LIGHTNING_ENABLE)
			ADMIN.assert_element_on_lightning_administration_page element_locator
		else
			ADMIN.assert_element_on_classic_administration_page element_locator
		end
	end

	# to assert an element with in administration page tiles in SF classic version
	# @param tile String = xpath of the tile, that contains the list of the items
	# @param list_element String = xpath of the list which contains some items
	def ADMIN.assert_element_under_administration_page_tile tile, list_element
		if(IS_LIGHTNING_ENABLE)
			ADMIN.assert_element_under_lightning_administration_page_tile tile, list_element
		else
			ADMIN.assert_element_under_classic_administration_page_tile tile, list_element
		end
	end

	# to assert an element using its label in SF classic version
	# @param element_label String = xpath of the label of the element, you want to assert
	def ADMIN.assert_element_using_label_on_administration_page element_label
		if(IS_LIGHTNING_ENABLE)
			ADMIN.assert_element_using_label_on_lightning_administration_page element_label
		else
			ADMIN.assert_element_using_label_on_classic_administration_page element_label
		end
	end

	# to enter the name of the program on program list page
	def ADMIN.set_program_name program_name
		if(IS_LIGHTNING_ENABLE)
			ADMIN.set_program_on_lightning program_name
		else
			ADMIN.set_program_on_classic program_name
		end
	end

	# to enter the name of the program on program list page in SF classic version
	# @program_name String = name of the program you want to create
	def ADMIN.set_program_on_classic program_name
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				fill_in 'New Program Name', with: program_name
				UTIL.wait_object_appear $admin_program_ok_button
				UTIL.page_load_waiting
			end
		end
	end

	# to enter the name of the program on program list page in SF lightning version
	# @program_name String = name of the program you want to create
	def ADMIN.set_program_on_lightning program_name
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.set_program_on_classic program_name
		end
	end

	# to click on OK button after entering the name of the program on program list page in SF classis version
	def ADMIN.click_on_program_ok_classic_button
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				find(:xpath, $admin_program_ok_button,:visible => true,:wait => 40).click
				UTIL.wait_object_appear $admin_add_program_product
			end
		end
	end

	# to click on OK button after entering the name of the program on program list page in SF lightning version
	def ADMIN.click_on_program_ok_lightning_button
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_on_program_ok_classic_button
		end
	end

	# to click on OK button after entering the name of the program on program list page
	def ADMIN.click_on_program_ok_button
		if(IS_LIGHTNING_ENABLE == true)
			ADMIN.click_on_program_ok_lightning_button
		else
			ADMIN.click_on_program_ok_classic_button
		end
	end

	# to click on add product button while creating a program in SF classis
	def ADMIN.click_on_add_program_product_classic_button
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				UTIL.re_execute_script_block do
					find(:xpath, $admin_add_program_product,:visible => true,:wait => 40).click
					logger.info 'Clicking on Add Program Product' 
				end
				UTIL.wait_object_appear $admin_label_remove_product_id
			end
		end
	end

	# to click on add product button while creating a program in SF lightning
	def ADMIN.click_on_add_program_product_lightning_button
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_on_add_program_product_classic_button
		end
	end

	# to click on add product button while creating a program
	def ADMIN.click_on_add_program_product_button
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_on_add_program_product_lightning_button
		else
			ADMIN.click_on_add_program_product_classic_button
		end
	end

	# to add a product with in a program, including all required steps
	def ADMIN.add_program_product product_count, product_name
		if(IS_LIGHTNING_ENABLE)
			 ADMIN.add_program_product_on_lightning product_count, product_name
		else
			ADMIN.add_program_product_on_classic product_count, product_name
		end
	end

	# to add a product with in a program, including all required steps in SF classic
	# @param product_count String = index of the product, if we are adding multiple products then it differentiates it
	# @param product_name String = name of the product, which you want to add in the program
	def ADMIN.add_program_product_on_classic product_count, product_name
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				find(:xpath,"(//label[contains(text(),'Program Asset Id')])[#{product_count}]/../following-sibling::div[1]//p", :visible =>true ,:wait => 50).click
				#UTIL.page_load_waiting
				UTIL.re_execute_script_block do
					find(:xpath,"(//input[@placeholder='Search Product Name'])[#{product_count}]", :visible =>true ,:wait => 30).set product_name
				end
				find(:xpath, "(//a[contains(@title,'"+product_name+"')])",:visible => true,:wait => 40).click
				logger.info "Setting the Product with Product Name -#{product_name}"  
			end
		end
	end

	# to add a product with in a program, including all required steps in SF lightning
	# @param product_count String = index of the product, if we are adding multiple products then it differentiates it
	# @param product_name String = name of the product, which you want to add in the program
	def ADMIN.add_program_product_on_lightning product_count, product_name
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.add_program_product_on_classic product_count, product_name
		end
	end

	# to click on refresh button to get the updated quantity of available product while creating a program
	# @param product_count String = index of the product, if we are adding multiple products then it differentiates it
	def ADMIN.click_on_available_budget_refresh_button product_count
		if(IS_LIGHTNING_ENABLE)
			 ADMIN.click_on_available_budget_refresh_button_on_lightning product_count
		else
			ADMIN.click_on_available_budget_refresh_button_on_classic product_count
		end
	end

	# to click on refresh button to get the updated quantity of available product while creating a program, in SF classic
	# @param product_count String = index of the product, if we are adding multiple products then it differentiates it
	def ADMIN.click_on_available_budget_refresh_button_on_classic product_count
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				find(:xpath,"(//i[@class='far fa-sync-alt text-success'])[#{product_count}]", :visible => true,:wait => 40).click
			  UTIL.page_load_waiting
			end
		end
	end

	# to click on refresh button to get the updated quantity of available product while creating a program, in SF lightning
	# @param product_count String = index of the product, if we are adding multiple products then it differentiates it
	def ADMIN.click_on_available_budget_refresh_button_on_lightning product_count
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_on_available_budget_refresh_button_on_classic product_count
		end
	end

	# to enter the selected product's quantity while creating a program
	# @param product_count String = index of the product, if we are adding multiple products then it differentiates it
	# @param budget_quantity String = quantity of the products you want to add in your product
	def ADMIN.set_budget_quantity_field product_count, budget_quantity
		if(IS_LIGHTNING_ENABLE)
			ADMIN.set_budget_quantity_field_on_lightning product_count,budget_quantity
		else
			ADMIN.set_budget_quantity_field_on_classic product_count,budget_quantity
		end
	end

	# to enter the selected product's quantity while creating a program in SF classic
	# @param product_count String = index of the product, if we are adding multiple products then it differentiates it
	# @param budget_quantity String = quantity of the products you want to add in your product
	def ADMIN.set_budget_quantity_field_on_classic product_count,budget_quantity
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				find(:xpath,"(//label[contains(text(), 'Budget Quantity')]/..//div//p)[#{product_count}]", :visible => true,:wait => 40).double_click
				#UTIL.min_wait
				UTIL.re_execute_script_block do
					find(:xpath,"(//label[contains(text(), 'Budget Quantity')]/..//div//input)[#{product_count}]", :visible => true,:wait => 40).set budget_quantity
				end
				UTIL.page_load_waiting
			end
		end
	end

	# to enter the selected product's quantity while creating a program in SF lightning
	# @param product_count String = index of the product, if we are adding multiple products then it differentiates it
	# @param budget_quantity String = quantity of the products you want to add in your product
	def ADMIN.set_budget_quantity_field_on_lightning product_count, budget_quantity
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.set_budget_quantity_field_on_classic product_count, budget_quantity
		end
	end

	# to enter/add the campaign name while creating a program
	# @param product_count String = index of the product, if we are adding multiple products then it differentiates it
	# @param campaign_name String = name of the campaign you want to add in your program
	def ADMIN.set_program_campaign_value product_count, campaign_name
		if(IS_LIGHTNING_ENABLE)
			ADMIN.set_program_campaign_value_in_lightning product_count, campaign_name
		else
			ADMIN.set_program_campaign_value_in_classic product_count, campaign_name
		end
	end

	# to enter/add the campaign name while creating a program in SF lightning
	# @param product_count String = index of the product, if we are adding multiple products then it differentiates it
	# @param campaign_name String = name of the campaign you want to add in your program
	def ADMIN.set_program_campaign_value_in_lightning product_count, campaign_name
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.set_program_campaign_value_in_classic product_count, campaign_name
		end
	end

	# to enter/add the campaign name while creating a program in SF classic
	# @param product_count String = index of the product, if we are adding multiple products then it differentiates it
	# @param campaign_name String = name of the campaign you want to add in your program
	def ADMIN.set_program_campaign_value_in_classic product_count, campaign_name
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.scroll_to "(//label[contains(text(),'Campaign Lookup')]/..//p)[#{product_count}]"
				UTIL.re_execute_script_block do
					find(:xpath, "(//label[contains(text(),'Campaign Lookup')]/..//p)[#{product_count}]", :visible =>true ,:wait => 30).double_click
					find(:xpath,"(//label[contains(text(),'Campaign Lookup')]/..//input)[#{product_count}]", :visible =>true ,:wait => 30).set campaign_name
					find(:xpath,"(//a[contains(@title, '"+campaign_name+"')])[#{product_count}]", :visible => true,:wait => 40).click
				end	
				UTIL.page_load_waiting
			end
		end
	end


  # to enter/add the campaign member status field's value during program creation
	# @param product_count String = index of the product, if we are adding multiple products then it differentiates it
	# @param campaign_status String = during program creation, after adding campaign name, its status is also added through this parameter
	def ADMIN.set_program_campaign_member_status_field product_count, campaign_status
		if(IS_LIGHTNING_ENABLE)
			 ADMIN.set_program_campaign_member_status_field_in_lightning product_count, campaign_status
		else
			ADMIN.set_program_campaign_member_status_field_in_classic product_count, campaign_status
		end
	end

	# to enter/add the campaign member status field's value during program creation, in SF classic
	# @param product_count String = index of the product, if we are adding multiple products then it differentiates it
	# @param campaign_status String = during program creation, after adding campaign name, its status is also added through this parameter
	def ADMIN.set_program_campaign_member_status_field_in_classic product_count, campaign_status
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				find(:xpath,"(//label[contains(text(),'Campaign Member Status')]/..//p)[#{product_count}]", :visible => true,:wait => 40).click
				#UTIL.page_load_waiting
				find(:xpath,"(//label[contains(text(),'Campaign Member Status')]/..//select//option[contains(text(), '"+campaign_status+"')])[#{product_count}]", :visible => true,:wait => 40).click
				#UTIL.page_load_waiting
			end
		end
	end

	# to enter/add the campaign member status field's value during program creation, in SF lightning
	# @param product_count String = index of the product, if we are adding multiple products then it differentiates it
	# @param campaign_status String = during program creation, after adding campaign name, its status is also added through this parameter
	def ADMIN.set_program_campaign_member_status_field_in_lightning product_count, campaign_status
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.set_program_campaign_member_status_field_in_classic product_count, campaign_status
		end
	end


	# to enter/add the assignment type field's value(role type/user type/autosend) during program creation
	# @param product_count String = index of the product, if we are adding multiple products then it differentiates it
	# @param role_type String = during program creation, role_type(role/user/autosend) is passed through this parameter
	def ADMIN.set_program_assignment_type product_count, role_type
		if(IS_LIGHTNING_ENABLE)
			 ADMIN.set_program_assignment_type_on_lightning product_count, role_type
		else
			ADMIN.set_program_assignment_type_on_classic product_count, role_type
		end
	end

	# to enter/add the assignment type field's value(role type/user type/autosend) during program creation in classic
	# @param product_count String = index of the product, if we are adding multiple products then it differentiates it
	# @param role_type String = during program creation, role_type(role/user/autosend) is passed through this parameter
	def ADMIN.set_program_assignment_type_on_classic product_count, role_type
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				find(:xpath,"(//label[contains(text(),'Assignment Type')]/..//p)[#{product_count}]", :visible => true,:wait => 40).click
				UTIL.page_load_waiting
				find(:xpath,"(//label[contains(text(),'Assignment Type')]/..//select//option[contains(text(), '"+role_type+"')])[#{product_count}]", :visible => true,:wait => 40).click
				UTIL.min_wait
			end
		end
	end

	# to enter/add the assignment type field's value(role type/user type/autosend) during program creation in lightning
	# @param product_count String = index of the product, if we are adding multiple products then it differentiates it
	# @param role_type String = during program creation, role_type(role/user/autosend) is passed through this parameter
	def ADMIN.set_program_assignment_type_on_lightning product_count, role_type
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.set_program_assignment_type_on_classic product_count, role_type
		end
	end

	# to add the role name if assignment type is selected as "Role"
	# @param role_name String = during program creation, role name (marketing manager, sales manager etc) is passed through this param
	def ADMIN.add_program_role_name role_name
		if(IS_LIGHTNING_ENABLE)
			 ADMIN.add_program_role_name_on_lightning role_name
		else
			ADMIN.add_program_role_name_on_classic role_name
		end
	end

	# to add the role name if assignment type is selected as "Role" in SF classic
	# @param role_name String = during program creation, role name (marketing manager, sales manager etc) is passed through this param
	def ADMIN.add_program_role_name_on_classic role_name
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.scroll_to $admin_program_role_name
				UTIL.re_execute_script_block do
					find(:xpath, $admin_program_role_name,:visible => true,:wait => 40).set role_name
				end
				#UTIL.scroll_to $admin_role_value_drop_down
				#find(:xpath, $admin_role_value_drop_down,:visible => true,:wait => 40).click
				UTIL.page_load_waiting
			end
		end
	end

	# to add the role name if assignment type is selected as "Role" in SF lightning
	# @param role_name String = during program creation, role name (marketing manager, sales manager etc) is passed through this param
	def ADMIN.add_program_role_name_on_lightning role_name
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.add_program_role_name_on_classic role_name
		end
	end

	# to click on "Add Role" button during program creation
	def ADMIN.click_on_add_role_button
		if(IS_LIGHTNING_ENABLE)
			 ADMIN.click_on_add_role_button_on_lightning
		else
			ADMIN.click_on_add_role_button_on_classic
		end
	end

	# to click on "Add Role" button during program creation in SF classic
	def ADMIN.click_on_add_role_button_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.re_execute_script_block do
					find(:xpath, $admin_program_add_role_button,:visible => true,:wait => 40).click
				end
				UTIL.page_load_waiting
			end
		end
	end

	# to click on "Add Role" button during program creation in SF lightning
	def ADMIN.click_on_add_role_button_on_lightning
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_on_add_role_button_on_classic
		end
	end

	# to click on "Add Users" button during program creation
	# @param product_count = index of the product, if we are adding multiple products then it differentiates it
	def ADMIN.click_on_add_users_button product_count
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_on_add_users_button_on_lightning product_count
		else
			ADMIN.click_on_add_users_button_on_classic product_count
		end
	end

	# to click on "Add Users" button during program creation in SF classic
	# @param product_count String = index of the product, if we are adding multiple products then it differentiates it
	def ADMIN.click_on_add_users_button_on_classic product_count
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.wait_object_appear $admin_add_user_button_on_program_page
				logger.info 'yes, element appears '
				UTIL.scroll_to "(//button[contains(text(),'Add Users')])[#{product_count}]"
				UTIL.re_execute_script_block do
					find(:xpath,"(//button[contains(text(),'Add Users')])[#{product_count}]",:visible => true,:wait => 40).double_click
				end
				UTIL.min_wait
				UTIL.wait_object_appear $admin_user_search_bar
				UTIL.scroll_to $admin_searchbar_on_users_page 
			end
		end
	end

	# to click on "Add Users" button during program creation in SF lightning
	# @param product_count String = index of the product, if we are adding multiple products then it differentiates it
	def ADMIN.click_on_add_users_button_on_lightning product_count
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_on_add_users_button_on_classic product_count
		end
	end

	# to select the user by searching and clicking on its respective checkbox in add user detailed page
	# @param user_name String = name of the user to add
	def ADMIN.select_user_to_add_in_program user_name
		if(IS_LIGHTNING_ENABLE)
			ADMIN.select_user_to_add_in_program_on_lightening user_name
		else
			ADMIN.select_user_to_add_in_program_on_classic user_name
		end
	end

	# to select the user by searching and clicking on its respective checkbox in add user detailed page in SF classic
	# @param user_name String = name of the user to add
	def ADMIN.select_user_to_add_in_program_on_classic user_name
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				find(:xpath, $admin_searchbar_on_users_page,:visible => true,:wait => 40).set user_name
				UTIL.min_wait
				UTIL.wait_object_appear "//td[contains(@title, '"+user_name+"')]/..//input[@type = 'checkbox']"
  	 			UTIL.re_execute_script_block do
					script = "$('#ckBxAll').click();"
  	 				page.driver.browser.execute_script(script)
				end	
				logger.info 'selected the checkbox successfully'
				UTIL.scroll_to $admin_add_user_button_on_users_page 
			end
		end
	end

	# to select the user by searching and clicking on its respective checkbox in add user detailed page in SF lightning
	# @param user_name String = name of the user to add
	def ADMIN.select_user_to_add_in_program_on_lightening user_name
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.select_user_to_add_in_program_on_classic user_name
		end
	end

	# to click on "add users" button on user detail page after selecting the user by clicking on its respective checkbox
	def ADMIN.click_on_add_users_button_on_users_page
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_on_add_users_button_on_users_page_on_lightening
		else
			ADMIN.click_on_add_users_button_on_users_page_on_classic
		end
	end

	# to click on "add users" button on user detail page after selecting the user by clicking on its respective checkbox in SF classic
	def ADMIN.click_on_add_users_button_on_users_page_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.re_execute_script_block do
					find(:xpath, $admin_add_user_button_on_users_page,:visible => true,:wait => 40).double_click
				end
				UTIL.med_wait
			end
		end
	end

	# to click on "add users" button on user detail page after selecting the user by clicking on its respective checkbox in SF lightning
	def ADMIN.click_on_add_users_button_on_users_page_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_on_add_users_button_on_users_page_on_classic
		end
	end

	# to click on "Yes" button available in confirmation popup after clicking on "add users" button on users list page during a program creation
	def ADMIN.click_on_add_user_confirmation_on_program
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_on_add_user_confirmation_on_program_on_lightening
		else
			ADMIN.click_on_add_user_confirmation_on_program_on_classic
		end
	end

# to click on "Yes" button available in confirmation popup after clicking on "add users" button on users list page during a program creation in SF classic
	def ADMIN.click_on_add_user_confirmation_on_program_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.scroll_to $admin_add_users_confirm_button_yes
				UTIL.re_execute_script_block do
					find(:xpath, $admin_add_users_confirm_button_yes,:visible => true,:wait => 40).click
				end	
				UTIL.min_wait
			end
		end
	end


	# to click on "Yes" button available in confirmation popup after clicking on "add users" button on users list page during a program creation in SF lightning
	def ADMIN.click_on_add_user_confirmation_on_program_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_on_add_user_confirmation_on_program_on_classic
		end
	end

# to click on "Yes" button available in confirmation popup after clicking on "add users" button on users list page during a program creation
	def ADMIN.click_on_yes_user_confirmation
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_on_yes_user_confirmation_on_lightening
		else
			ADMIN.click_on_yes_user_confirmation_on_classic
		end
	end

def ADMIN.click_on_yes_user_confirmation_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.scroll_to $admin_add_users_confirm_button_yes
				UTIL.re_execute_script_block do
					find(:xpath, $admin_add_users_confirm_button_yes,:visible => true,:wait => 40).click
				end	
				UTIL.min_wait
			end
		end
	end

def ADMIN.click_on_yes_user_confirmation_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_on_yes_user_confirmation_on_classic
		end
	end

	# to click on "OK" button available in confirmation popup after clicking on "add users" button on users list page during a program creation
	def ADMIN.click_on_ok_user_confirmation
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_on_ok_user_confirmation_on_lightening
		else
			ADMIN.click_on_ok_user_confirmation_on_classic
		end
	end

	# to click on "OK" button available in confirmation popup after clicking on "add users" button on users list page during a program creation in SF classic
	def ADMIN.click_on_ok_user_confirmation_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.scroll_to $admin_add_users_confirm_button_ok
				UTIL.re_execute_script_block do
					find(:xpath, $admin_add_users_confirm_button_ok,:visible => true,:wait => 40).click
				end	
				UTIL.min_wait
			end
		end
	end

	# to click on "OK" button available in confirmation popup after clicking on "add users" button on users list page during a program creation in SF lightning
	def ADMIN.click_on_ok_user_confirmation_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_on_ok_user_confirmation_on_classic
		end
	end

	# to active the program after filling all required fields during program creation
	def ADMIN.activate_program
		if(IS_LIGHTNING_ENABLE)
			ADMIN.activate_program_on_lightening
		else
			ADMIN.activate_program_on_classic
		end
	end

	# to active the program after filling all required fields during program creation in SF classic
	def ADMIN.activate_program_on_classic
		ADMIN.wait_object_load $admin_active_program_toggle
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.scroll_to $admin_active_program_toggle
				UTIL.re_execute_script_block do	
					find(:xpath, $admin_active_program_toggle,:visible => true,:wait => 40).click
				end
			end
		end
	end

	# to active the program after filling all required fields during program creation in SF lightning
	def ADMIN.activate_program_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.activate_program_on_classic
		end
	end

	# to click on program header link(to go back to program list page) which appears after activating the program
	def ADMIN.click_on_program_header
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_on_program_header_on_lightening
		else
			ADMIN.click_on_program_header_on_classic
		end
	end

	# to click on program header link(to go back to program list page) which appears after activating the program on SF classic
	def ADMIN.click_on_program_header_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.scroll_to $admin_program_header
				UTIL.re_execute_script_block do
					find(:xpath, $admin_program_header,:visible => true,:wait => 40).click
				end
				UTIL.wait_object_appear $admin_program_admin_page_title
			end
		end
	end

	# to click on program header link(to go back to program list page) which appears after activating the program on SF lightening
	def ADMIN.click_on_program_header_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_on_program_header_on_classic
		end
	end
	# to verify the program on program list page
	# @param program_name String = name of the program, which you want to assert on program list page
	def ADMIN.verify_program_on_admin_page program_name
		if(IS_LIGHTNING_ENABLE)
			ADMIN.verify_program_on_admin_page_on_lightening program_name
		else
			ADMIN.verify_program_on_admin_page_on_classic program_name
		end
	end

	# to verify the program on program list page in SF classic
	# @param program_name String = name of the program, which you want to assert on program list page
	def ADMIN.verify_program_on_admin_page_on_classic program_name
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.med_wait
				fill_in 'inputSearch', with: program_name
				UTIL.med_wait
				# return expect(page).to have_xpath("(//td[contains(text(),'"+program_name+"')])[1]")
				return page.has_xpath?("(//td[contains(text(),'"+program_name+"')])[1]")
			end
		end
	end

	# to verify the program on program list page in SF lightning
	# @param program_name String = name of the program, which you want to assert on program list page
	def ADMIN.verify_program_on_admin_page_on_lightening program_name
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.verify_program_on_admin_page_on_classic program_name
		end
	end

	# to verify if program is activated or not
	# @param program_status String = pass the value of program status(active/inactive) in form of xpath
	def ADMIN.verify_program_activated_inactivated program_status
		if(IS_LIGHTNING_ENABLE)
			ADMIN.verify_program_activated_inactivated_on_lightening program_status
		else
			ADMIN.verify_program_activated_inactivated_on_classic program_status
		end
	end

	# to verify if program is activated or not in SF classic
	# @param program_status String = pass the value of program status(active/inactive) in form of xpath
	# returns true if the available program is active/inactive(based on passed parameter)
	def ADMIN.verify_program_activated_inactivated_on_classic program_status
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.wait_object_appear program_status
				UTIL.re_execute_script_block do
					return page.has_xpath?(program_status)
				end
			end
		end
	end

	# to verify if program is acitvated or not in SF lightning
	# @param program_status String = pass the value of program status(active/inactive) in form of xpath
	# returns true if the available program is active/inactive(based on passed parameter)
	def ADMIN.verify_program_activated_inactivated_on_lightening program_status
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.verify_program_activated_inactivated_on_classic program_status
		end
	end

	# to get the avilable product quantity on program page, while creating a new program
	def ADMIN.get_product_quantity
		if(IS_LIGHTNING_ENABLE)
			ADMIN.get_product_quantity_on_lightening
		else
			ADMIN.get_product_quantity_on_classic
		end
	end

	# to get the available product quantity on program page, while creating a new program, in SF lightning
	def ADMIN.get_product_quantity_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.get_product_quantity_on_classic
		end
	end

	# to get the available product quantity on program page, while creating a new program, in SF classic
	# returns product quantity by increasing 1 count in maximum available quantity
	def ADMIN.get_product_quantity_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				product_value =	find(:xpath,$admin_budget_quantity_value, :visible => true,:wait => 40).text
				net_product_value = product_value.delete('/')
				final_product_value = net_product_value.to_i + 1
				puts "value of budget quantity is: #{final_product_value}"
				return final_product_value
				UTIL.page_load_waiting
			end
		end
	end

	# to get allocated user budget value, available on program creation page, in SF lightning
	def ADMIN.get_user_budget_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.get_user_budget_on_classic
		end
	end

	# to get allocated user budget value, available on program creation page
	def ADMIN.get_user_budget
		if(IS_LIGHTNING_ENABLE)
			ADMIN.get_user_budget_on_lightening
		else
			ADMIN.get_user_budget_on_classic
		end
	end

	# to get allocated user budget value, available on program creation page, in SF classic
	# returns allocated user budget quantity by increasing 1 count in maximum available quantity
	def ADMIN.get_user_budget_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				user_budget = find(:xpath,$admin_user_budget_quantity, visible:true).text
				user_final_budget = user_budget.to_i
				updated_user_final_budget = user_final_budget + 1
				puts "value of user budget is: #{updated_user_final_budget}"
				return updated_user_final_budget
			end
		end
	end

	# unused Method
	# to change/add the user budget on program creation page
	# @param increased_user_budget String = value of user budget we want to give to added user in a program
	def ADMIN.set_user_budget increased_user_budget
		if(IS_LIGHTNING_ENABLE)
			ADMIN.set_user_budget_on_lightening increased_user_budget
		else
			ADMIN.set_user_budget_on_classic increased_user_budget
		end
	end

	# to change/add the user budget on program creation page, in SF classic
	# @param increased_user_budget String = value of user budget we want to give to added user in a program
	def ADMIN.set_user_budget_on_classic  increased_user_budget
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.scroll_to $admin_user_budget_quantity
				find(:xpath,$admin_user_budget_quantity, :visible => true,:wait => 40).click
				UTIL.re_execute_script_block do
					find(:xpath,$admin_user_budget_quantity_text, :visible => true,:wait => 40).set increased_user_budget
				end
				UTIL.min_wait
			end
		end
	end

	# to change/add the user budget on program creation page, in SF lightning
	# @param increased_user_budget String = value of user budget we want to give to added user in a program
	def ADMIN.set_user_budget_on_lightening increased_user_budget
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.set_user_budget_on_classic increased_user_budget
		end
	end

	# to assert the user budget during program creation, if assigned budget is more than the available
	# @param budget_exceed_msg String = its a validation message/string, appears on program creation screen if user is assigned more budget than the available
	def ADMIN.assert_validation_for_exceed_program_user_budget budget_exceed_msg
		if(IS_LIGHTNING_ENABLE)
			ADMIN.assert_validation_for_exceed_program_user_budget_on_lightening budget_exceed_msg
		else
			ADMIN.assert_validation_for_exceed_program_user_budget_on_classic budget_exceed_msg
		end
	end

	# to assert the user budget during program creation, if assigned budget is more than the available, in SF classic
	# @param budget_exceed_msg String = its a validation message/string, appears on program creation screen if user is assigned more budget than the available
	# returns a message(string) depends on, validation message's appearance on the page
	def ADMIN.assert_validation_for_exceed_program_user_budget_on_classic budget_exceed_msg
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do

				r1 = page.has_xpath?("//div[@id='alert-area']//p[contains(.,'"+budget_exceed_msg+"')]")
				if 	(r1 == true)
					puts " #{budget_exceed_msg} error exists: #{r1}"
					return r1
				else
					puts "error #{budget_exceed_msg} doesn't exist"
				end
				UTIL.page_load_waiting
			end
	 	end
	end

	# to assert the user budget during program creation, if assigned budget is more than the available, in SF lightning
	# @param budget_exceed_msg String = its a validation message/string, appears on program creation screen if user is assigned more budget than the available
	# returns a message(string) depends on, validation message's appearance on the page
	def ADMIN.assert_validation_for_exceed_program_user_budget_on_lightening budget_exceed_msg
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.assert_validation_for_exceed_program_user_budget_on_classic budget_exceed_msg
		end
	end

	# to click on the program name during program search, on program administration page
	# @param program_name String= name of the program to be searched
	def ADMIN.click_on_program_from_search_result program_name
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_on_program_from_search_result_on_lightning program_name
		else
			ADMIN.click_on_program_from_search_result_on_classic program_name
		end
	end

	def ADMIN.click_on_program_from_search_result_on_lightning program_name
		within_frame(find(:xpath, $con_lightning_frame)) do
			ADMIN.click_on_program_from_search_result_on_classic program_name
		end
	end

	def ADMIN.click_on_program_from_search_result_on_classic program_name
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.re_execute_script_block do
					find(:xpath,"(//td[contains(.,'"+program_name+"')])[1]",:visible => true,:wait => 40).click
				end	
				UTIL.min_wait
			end
		end
	end

	# to click on any element with in administration section(as we are already including iframe in the structure)
	# @param element_xpath String = xpath of the element, on which you want to click
	def ADMIN.click_on_element element_xpath
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_on_element_on_lightning element_xpath
		else
			ADMIN.click_on_element_on_classic element_xpath
		end
	end

	# to click on any element with in administration section(as we are already including iframe in the structure) on classic
	# @param element_xpath String = xpath of the element, on which you want to click
	def ADMIN.click_on_element_on_classic element_xpath
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				find(:xpath, element_xpath,:visible => true,:wait => 40).click
				UTIL.min_wait
			end
		end
	end

	# to click on any element with in administration section(as we are already including iframe in the structure) on SF Lightning
	# @param element_xpath String = xpath of the element, on which you want to click
	def ADMIN.click_on_element_on_lightning element_xpath
		within_frame(find(:xpath, $con_lightning_frame)) do
			ADMIN.click_on_element_on_classic element_xpath
		end
	end

	# to verify the content/element on the page
	# @param content_xpath String = xpath of the content/element you want to assert on the page
	def ADMIN.verify_content_on_page content_xpath
		if(IS_LIGHTNING_ENABLE)
			ADMIN.verify_content_on_page_on_lightening content_xpath
		else
			ADMIN.verify_content_on_page_on_classic content_xpath
		end
	end

	# to verify the content/element on the page, on SF classic
	# @param content_xpath String = xpath of the content/element you want to assert on the page
	def ADMIN.verify_content_on_page_on_classic content_xpath
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				# return expect(page).to have_xpath(content_xpath)
				return page.has_xpath?(content_xpath)
			end
		end
	end

	# to verify the content/element on the page, on SF lightning
	# @param content_xpath String = xpath of the content/element you want to assert on the page
	def ADMIN.verify_content_on_page_on_lightening content_xpath
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.verify_content_on_page_on_classic content_xpath
		end
	end

	# unused method
	# to perform advance search on user administration page, by using different parameters such as name, title, role, profile and many more
	# @param id String = id of the text box of the criteria/parameter, you want to perform search, such as name, title, email etc
	# @param  input_text String = value of the input search, such as Manager(in case of role) etc
	def ADMIN.search_by_multiple_parameter_Advance_Search id, input_text
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				find(:xpath,"//input[@id='"+id+"']",:visible => true,:wait => 40).set input_text
				UTIL.min_wait
			end
		end
	end

	# to assert the search result value, during advance search with in administration section
	# @param parameter String = it is result value, you want to assert in search result
	def ADMIN.verify_value_using_advance_search parameter
		if(IS_LIGHTNING_ENABLE)
			ADMIN.verify_value_using_advance_search_on_lightening parameter
		else
			ADMIN.verify_value_using_advance_search_on_classic parameter
		end
	end

	# to assert the search result value, during advance search with in administration section, in SF classic
	# @param parameter String = it is result value, you want to assert in search result
	# returns boolean value true, if value is asserted successfully
	def ADMIN.verify_value_using_advance_search_on_classic parameter
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.wait_object_appear ("//td[contains(@title,'"+parameter+"')]")
				return expect(page).to have_xpath("//td[contains(@title,'"+parameter+"')]")
			end
		end
	end

	# to assert the search result value, during advance search with in administration section, in SF lightning
	# @param parameter String = it is result value, you want to assert in search result
	# returns boolean value true, if value is asserted successfully
	def ADMIN.verify_value_using_advance_search_on_lightening parameter
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.verify_value_using_advance_search_on_classic parameter
		end
	end

	# to click on search result in user administration section
	def ADMIN.open_user_detail_section
		if(IS_LIGHTNING_ENABLE)
			ADMIN.open_user_detail_section_on_lightening
		else
			ADMIN.open_user_detail_section_on_classic
		end
	end

	# to click on search result in user administration section in SF classic
	def ADMIN.open_user_detail_section_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				UTIL.scroll_to $admin_user_detail
				UTIL.re_execute_script_block do
					find(:xpath, $admin_user_detail,:visible => true,:wait => 40).click
					logger.info 'Clicked on User Detail'
				end
				UTIL.wait_object_appear $admin_user_remove_button
			end
		end
	end

	# to click on search result in user administration section in SF lightning
	def ADMIN.open_user_detail_section_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.open_user_detail_section_on_classic
		end
	end

	# to perform advance search on user administration page, by using different parameters such as name, title, role, profile and many more
	# @param id String = id of the text box of the criteria/parameter, you want to perform search, such as name, title, email etc
	# @param  input_text String = value of the input search, such as Manager(in case of role) etc
	def ADMIN.advance_search_using_id_and_value id, input_text
		if(IS_LIGHTNING_ENABLE)
			ADMIN.advance_search_using_id_and_value_on_lightening id, input_text
		else
			ADMIN.advance_search_using_id_and_value_on_classic id, input_text
		end
	end

	# to perform advance search on user administration page, by using different parameters such as name, title, role, profile and many more in, SF classic
	# @param id String = id of the text box of the criteria/parameter, you want to perform search, such as name, title, email etc
	# @param input_text String = value of the input search, such as Manager(in case of role) etc
	def ADMIN.advance_search_using_id_and_value_on_classic id, input_text
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				find(:xpath,"//input[@id='"+id+"']",:visible => true,:wait => 40).set input_text
				UTIL.min_wait
			end
		end
	end

	# to perform advance search on user administration page, by using different parameters such as name, title, role, profile and many more in, SF lightning
	# @param id String = id of the text box of the criteria/parameter, you want to perform search, such as name, title, email etc
	# @param input_text String = value of the input search, such as Manager(in case of role) etc
	def ADMIN.advance_search_using_id_and_value_on_lightening id, input_text
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.advance_search_using_id_and_value_on_classic id, input_text
		end
	end

	# unused method
	# to assert the search result in administration section
	# @param parameter String = value/text to be asserted
	def ADMIN.verify_search_by_multiple_parameters parameter
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				return expect(page).to have_xpath("//td[contains(@title,'"+parameter+"')]")
			end
		end
	end

	# to perform advance search with email
	# @param email String = email value, which has to be search out during advance search
	def ADMIN.search_email_Advance_Search email
		if(IS_LIGHTNING_ENABLE)
			ADMIN.search_email_Advance_Search_on_lightening email
		else
			ADMIN.search_email_Advance_Search_on_classic email
		end
	end

	# to perform advance search with email, in SF classic
	# @param email String = email value, which has to be search out during advance search
	def ADMIN.search_email_Advance_Search_on_classic email
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				find(:xpath, $admin_search_email,:visible => true,:wait => 40).set email
				UTIL.min_wait
			end
		end
	end

	# to perform advance search with email, in SF lightning
	# @param email String = email value, which has to be search out during advance search
	def ADMIN.search_email_Advance_Search_on_lightening email
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.search_email_Advance_Search_on_classic email
		end
	end

	# to search the access level value during advance search
	def ADMIN.search_access_level_Advance_Search
		if(IS_LIGHTNING_ENABLE)
			ADMIN.search_access_level_Advance_Search_on_lightening
		else
			ADMIN.search_access_level_Advance_Search_on_classic
		end
	end

	# to select the access level as admin during advance search, in SF classic
	def ADMIN.search_access_level_Advance_Search_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				find(:xpath, $admin_search_admin_access_level,:visible => true,:wait => 40).click
				UTIL.min_wait
			end
		end
	end

	# to select the access level as admin during advance search, in SF lightning
	def ADMIN.search_access_level_Advance_Search_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.search_access_level_Advance_Search_on_classic
		end
	end

	# to click on user administration tile in administration section
	def ADMIN.click_user_admin_tile
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				find(:xpath, $admin_user_admin_tile,:visible => true,:wait => 40).click
				UTIL.wait_object_appear $admin_user_admin_page_title
			end
		end
	end

	# to click on advance search button available on user administration page
	def ADMIN.click_on_advanced_search_button
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_on_advanced_search_button_on_lightening
		else
			ADMIN.click_on_advanced_search_button_on_classic
		end
	end

	# to click on advance search button available on user administration page, in SF classic
	def ADMIN.click_on_advanced_search_button_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.min_wait
				find(:xpath,$admin_advance_search_button,:visible => true,:wait => 40).click
				UTIL.wait_object_appear $admin_advance_search_Tile
				UTIL.min_wait
			end
		end
	end

	# to click on advance search button available on user administration page, in SF lightning
	def ADMIN.click_on_advanced_search_button_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_on_advanced_search_button_on_classic
		end
	end

	# to remove the user from store, in user administration section
	def ADMIN.remove_user_on_Store
		if(IS_LIGHTNING_ENABLE)
			ADMIN.remove_user_on_Store_on_lightening
		else
			ADMIN.remove_user_on_Store_on_classic
		end
	end

	# to remove the user from store, in user administration section, in SF classic
	def ADMIN.remove_user_on_Store_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				UTIL.re_execute_script_block do
					find(:xpath, $admin_user_remove_button,:visible => true,:wait => 40).click
					logger.info 'Clicked on Remove Button'
				end
				UTIL.wait_object_appear $admin_user_remove_confirmation_popup
			end
		end
	end

	# to remove the user from store, in user administration section, in SF lightning
	def ADMIN.remove_user_on_Store_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.remove_user_on_Store_on_classic
		end
	end

	# to assert a validation message with in administration/swagiq package
	def ADMIN.verify_unauthorized_message_on_administrator_page
		if(IS_LIGHTNING_ENABLE)
			ADMIN.verify_unauthorized_message_on_administrator_page_on_lightening
		else
			ADMIN.verify_unauthorized_message_on_administrator_page_on_classic
		end
	end

	# to assert a validation message with in administration/swagiq package, in SF classsic
	def ADMIN.verify_unauthorized_message_on_administrator_page_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath, $con_canvas_innerframe))do
				return page.has_xpath?($admin_swagiq_tools_error_msg)
				#return page.has_xpath?("//h3[contains(text(),'You are not authorized to view that resource.')]")
			end
		end
	end

	# to assert a validation message with in administration/swag_iq package, in SF lightning
	def ADMIN.verify_unauthorized_message_on_administrator_page_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.verify_unauthorized_message_on_administrator_page_on_classic
		end
	end

	# to click on "add users" button  on user administration page
	def ADMIN.click_on_add_users_button_on_users_administration_page
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_on_add_users_button_on_users_administration_page_on_lightening
		else
			ADMIN.click_on_add_users_button_on_users_administration_page_on_classic
		end
	end

	# to click on "add users" button  on user administration page, in SF classic
	def ADMIN.click_on_add_users_button_on_users_administration_page_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.re_execute_script_block do
					find(:xpath, $admin_add_user_button_on_users_admin_page,:visible => true,:wait => 40).click
				end	
				UTIL.min_wait
			end
		end
	end

	# to click on "add users" button  on user administration page, in SF lightning
	def ADMIN.click_on_add_users_button_on_users_administration_page_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_on_add_users_button_on_users_administration_page_on_classic
		end
	end

	# to select a user in store by clicking on its corresponding checkbox
	def ADMIN.select_user_to_add_in_store
		if(IS_LIGHTNING_ENABLE)
			ADMIN.select_user_to_add_in_store_on_lightening
		else
			ADMIN.select_user_to_add_in_store_on_classic
		end
	end

	# to select a user in store by clicking on its corresponding checkbox, in SF classic
	def ADMIN.select_user_to_add_in_store_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				find(:xpath, $admin_select_checkbox_user,:visible => true,:wait => 40).click
			end
		end
	end

	# to select a user in store by clicking on its corresponding checkbox, in SF lightning
	def ADMIN.select_user_to_add_in_store_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.select_user_to_add_in_store_on_classic
		end
	end

	# to click on "Add user" button in store
	def ADMIN.click_add_user_button_in_store
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_add_user_button_in_store_on_lightening
		else
			ADMIN.click_add_user_button_in_store_on_classic
		end
	end

	# to click on "Add user" button in store, in SF classic
	def ADMIN.click_add_user_button_in_store_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				find(:xpath,$admin_add_user_button_for_adding_user,:visible => true,:wait => 40).click
				UTIL.wait_object_appear $admin_user_add_confirmation_popup
				UTIL.min_wait
			end
		end
	end

	# to click on "Add user" button in store, in SF lightning
	def ADMIN.click_add_user_button_in_store_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_add_user_button_in_store_on_classic
		end
	end

	# unused method
	# to search and click on product name after getting the search result
	# @param product_name String = name of the product, you want to search
	def ADMIN.select_product_on_product_administration product_name
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				find(:xpath, $admin_product_search_bar).click
				UTIL.page_load_waiting
				find(:xpath,"(//input[@placeholder='Search Products'])", :visible => true,:wait => 40).set product_name
				UTIL.page_load_waiting
				find(:xpath, "(//strong[contains(text(), 'Display as: ')]/..)", :visible => true,:wait => 40).click
			end
		end
	end

	# unused method
	# to fill the product display name field with in product administration section
	# @param product_display_name String = name of the product you want to put in display search result during program creation
	def ADMIN.fill_product_display_name product_display_name
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				find(:xpath, $admin_display_name_textbox,:visible => true,:wait => 40).click
				fill_in 'Enter a Display Name', with: product_display_name
				UTIL.min_wait
			end
		end
	end

	# to click on "active" toggle button, in order to activate a product, with in product administration section
	def ADMIN.click_activate_product
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_activate_product_on_lightening
		else
			ADMIN.click_activate_product_on_classic
		end
	end

	# to click on "active" toggle button, in order to activate a product, with in product administration section on SF Classic
	def ADMIN.click_activate_product_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				if(UTIL.verify_xpath_on_page_on_classic $admin_activate_product_toggle)
					find(:xpath, $admin_activate_product_toggle,:visible => true,:wait => 40).click
					UTIL.min_wait
					find(:xpath, $admin_product_save_button,:visible => true,:wait => 40).click
				else
					UTIL.min_wait
				end
			end
		end
	end

	# to click on "active" toggle button, in order to activate a product, with in product administration section on SF Lightning
	def ADMIN.click_activate_product_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_activate_product_on_classic
		end
	end
	
	# unused method
	# to click on save product button, after making any changes in any specific product within product administration section
	def ADMIN.save_product
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				find(:xpath, $admin_product_save_button,:visible => true,:wait => 40).click
				UTIL.min_wait
			end
		end
	end

	# unused method
	# to click on swagiq_tools tab within swagiq administration section
	def ADMIN.click_swag_tools_tab
		find(:xpath, $admin_swag_tools_tab,:visible => true,:wait => 40).click
		UTIL.min_wait
	end

	# to click the product search bar and enter the name of the product in there, with in product administration section
	def ADMIN.click_product_search_bar_on_product_administration product_name
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_product_search_bar_on_product_administration_on_lightening product_name
		else
			ADMIN.click_product_search_bar_on_product_administration_on_classic product_name
		end
	end

# to click the product search bar and enter the name of the product in there, with in product administration section on SF Classic
	def ADMIN.click_product_search_bar_on_product_administration_on_classic product_name
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				find(:xpath, $admin_product_search_bar,:visible => true,:wait => 40).click
				UTIL.page_load_waiting
				 find(:xpath, $admin_product_search_bar, :visible => true,:wait => 40).set product_name
				#find(:xpath,"(//input[@placeholder='Search Products'])", visible:true).set product_name
				UTIL.min_wait
				#return page.has_xpath?("//strong[contains(text(), 'Display as: ')]/..")
			end
		end
	end

	# to click the product search bar and enter the name of the product in there, with in product administration section on SF lightning
	def ADMIN.click_product_search_bar_on_product_administration_on_lightening product_name
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_product_search_bar_on_product_administration_on_classic product_name
		end
	end

	# to click on "inactive" toggle button, in order to deactivate a product, with in product administration section
	def ADMIN.click_deactivate_product
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_deactivate_product_on_lightening
		else
			ADMIN.click_deactivate_product_on_classic
		end
	end

	# to click on "inactive" toggle button, in order to deactivate a product, with in product administration section on SF Classic
	def ADMIN.click_deactivate_product_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				#if (UTIL.verify_xpath_on_page $admin_deactivate_product_toggle)
					find(:xpath, $admin_deactivate_product_toggle,:visible => true,:wait => 40).click
					UTIL.min_wait
					find(:xpath, $admin_product_save_button,:visible => true,:wait => 40).click
				#else
					UTIL.min_wait
				#end
			end
		end
	end

	# to click on "inactive" toggle button, in order to deactivate a product, with in product administration section on SF Lightning
	def ADMIN.click_deactivate_product_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_deactivate_product_on_classic
		end
	end
	# unused
	# to assert a message of product's unavailability due to its disablement
	def ADMIN.assert_validation_for_inactive_product_on_program
		UTIL.re_execute_script_block do
			within_frame(find(:xpath, $con_canvas_outerframe)) do
				within_frame(find(:xpath, $con_canvas_innerframe)) do
					return page.has_xpath?("//i[contains(@uib-tooltip,'Selected product is disabled, the program can not be activated with disabled products')]")
				end
			end
		end
	end

	# unused method
	def ADMIN.click_store_setting_tile
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				UTIL.min_wait
				puts "now will click on program admin tile"
				find(:xpath, $admin_store_setting_tile,:visible => true,:wait => 40).click
				UTIL.min_wait
				UTIL.wait_object_appear $admin_store_setting_page_title
			end
		end
	end

	# to search user on user list page, available in user administration section
	# @param user_name String = user which has to be searched out
	def ADMIN.search_user_on_user_administration user_name
		if(IS_LIGHTNING_ENABLE)
			ADMIN.search_user_on_user_administration_on_lightening user_name
		else
			ADMIN.search_user_on_user_administration_on_classic user_name
		end
	end

	# to search user on user list page, available in user administration section, in SF classic
	# @param user_name String = user which has to be searched out
	def ADMIN.search_user_on_user_administration_on_classic user_name
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				UTIL.scroll_to $admin_searchbar_on_users_page
				UTIL.re_execute_script_block do
					find(:xpath, $admin_searchbar_on_users_page,:visible => true,:wait => 40).set user_name
				end
				UTIL.min_wait
			end
		end
	end

	# to click on product in order to get its details with in product administration section
	# @param product_name String = name of the product on which you want to click
	def ADMIN.click_product_detail_section product_name
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_product_detail_section_on_lightening product_name
		else
			ADMIN.click_product_detail_section_on_classic product_name
		end
	end

	# to click on product in order to get its details with in product administration section on SF classic
	# @param product_name String = name of the product on which you want to click
	def ADMIN.click_product_detail_section_on_classic product_name
		UTIL.re_execute_script_block do
			within_frame(find(:xpath, $con_canvas_outerframe)) do
				within_frame(find(:xpath, $con_canvas_innerframe))do
					find(:xpath, "(//span[contains(.,'"+product_name+"')])[1]").click
					UTIL.wait_object_appear $admin_product_display_label
				end
			end
		end
	end

	# to click on product in order to get its details with in product administration section on SF Lightning
	# @param product_name String = name of the product on which you want to click
	def ADMIN.click_product_detail_section_on_lightening product_name
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_product_detail_section_on_classic product_name
		end
	end
	# to search user on user list page, available in user administration section, in SF lightning
	# @param user_name String = user which has to be searched out
	def ADMIN.search_user_on_user_administration_on_lightening user_name
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.search_user_on_user_administration_on_classic user_name
		end
	end

	# to click on budget allocation label during program creation
	def ADMIN.click_on_budget_allocation_label
		if(IS_LIGHTNING_ENABLE)
			ADMIN.click_on_budget_allocation_label_on_lightening
		else
			ADMIN.click_on_budget_allocation_label_on_classic
		end
	end

	# to click on budget allocation label during program creation, in SF classic
	def ADMIN.click_on_budget_allocation_label_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				find(:xpath, $admin_budget_allocation_label).click
				#find(:xpath,"//label[contains(.,'Budget Allocation')]").click
			end
		end
	end

	# to click on budget allocation label during program creation, in SF lightning
	def ADMIN.click_on_budget_allocation_label_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.click_on_budget_allocation_label_on_classic
		end
	end

	# to enter the budget value with in budget allocation field
	# @param budget_allocation String = value of the budget, you want to set during program creation
	def ADMIN.set_budget_allocation_field budget_allocation
		if(IS_LIGHTNING_ENABLE)
			ADMIN.set_budget_allocation_field_on_lightening budget_allocation
		else
			ADMIN.set_budget_allocation_field_on_classic budget_allocation
		end
	end

	# to enter the budget value with in budget allocation field, in SF classic
	# @param budget_allocation String = value of the budget, you want to set during program creation
	def ADMIN.set_budget_allocation_field_on_classic budget_allocation
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.re_execute_script_block do
					find(:xpath, $admin_budget_allocation_field, :visible => true,:wait => 40).double_click
				end	
				find(:xpath,"(//label[contains(text(),'Budget Allocation')]/..//select//option[contains(text(), '"+budget_allocation+"')])", :visible => true,:wait => 40).click
				UTIL.page_load_waiting
			end
		end
	end

	# to enter the budget value with in budget allocation field, in SF lightning
	# @param budget_allocation String = value of the budget, you want to set during program creation
	def ADMIN.set_budget_allocation_field_on_lightening budget_allocation
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.set_budget_allocation_field_on_classic budget_allocation
		end
	end


	# unused method
	def ADMIN.click_save_information_button
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				find(:xpath, $admin_save_info_button).click
				UTIL.min_wait
			end
		end
	end

	
	# to get the unallocated quantity of the product, which appears after clicking on any product
	# returns unallocated quantity of the product available on product detail page, with in product administration
	def ADMIN.get_unallocated_qty
		if(IS_LIGHTNING_ENABLE)
			ADMIN.get_unallocated_qty_on_lightening
		else
			ADMIN.get_unallocated_qty_on_classic
		end
	end

	
	# to get the unallocated quantity of the product, which appears after clicking on any product
	# returns unallocated quantity of the product available on product detail page, with in product administration on SF Classic
	def ADMIN.get_unallocated_qty_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				qty_string = find(:xpath, $admin_product_unallocated_qty).text
				puts "value of unallocated quantity is #{qty_string}"
				return qty_string
			end
		end
	end

	
	# to get the unallocated quantity of the product, which appears after clicking on any product
	# returns unallocated quantity of the product available on product detail page, with in product administration on SF Lightning
	def ADMIN.get_unallocated_qty_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.get_unallocated_qty_on_classic
		end
	end
	# to get product quantity on create program page
	# returns the available product quantity on program creation page
	def ADMIN.get_product_quantity_on_program_page
		if(IS_LIGHTNING_ENABLE)
			ADMIN.get_product_quantity_on_program_page_on_lightening
		else
			ADMIN.get_product_quantity_on_program_page_on_classic
		end
	end

	
	# to get product quantity on create program page
	# returns the available product quantity on program creation page on SF Classic
	def ADMIN.get_product_quantity_on_program_page_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath, $con_canvas_innerframe))do
				product_value =	find(:xpath, $admin_available_product_qty, visible:true).text
				puts "value of budget quantity is: #{product_value}"
				return product_value
			end
		end
	end

	
	# to get product quantity on create program page
	# returns the available product quantity on program creation page on SF Lightning
	def ADMIN.get_product_quantity_on_program_page_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.get_product_quantity_on_program_page_on_classic
		end
	end
	# to inactivate a program, after its successful creation
	def ADMIN.inactivate_program
		if(IS_LIGHTNING_ENABLE)
			ADMIN.inactivate_program_on_lightening
		else
			ADMIN.inactivate_program_on_classic
		end
	end

	
	# to inactivate a program, after its successful creation on SF Classic
	def ADMIN.inactivate_program_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				find(:xpath, $admin_inactive_program_toggle).click
				UTIL.min_wait
			end
		end
	end

	
	# to inactivate a program, after its successful creation on SF lightening
	def ADMIN.inactivate_program_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.inactivate_program_on_classic
		end
	end

	
	# to change the user access type to "standard" type, with in user administration section
	def ADMIN.change_user_access_to_standard
		if(IS_LIGHTNING_ENABLE)
			ADMIN.change_user_access_to_standard_on_lightening
		else
			ADMIN.change_user_access_to_standard_on_classic
		end
	end

	# to change the user access type to "standard" type, with in user administration section, in SF lightning
	def ADMIN.change_user_access_to_standard_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.change_user_access_to_standard_on_classic
		end
	end


	# to change the user access type to "standard" type, with in user administration section, in SF classic
	def ADMIN.change_user_access_to_standard_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				find(:xpath, $admin_user_access_type,:visible => true,:wait => 40).click
				find(:xpath, $admin_standard_user_access_type,:visible => true,:wait => 40).click
			end
		end
	end


	# to change the user access type to "admin" type, with in user administration section
	def ADMIN.change_user_access_to_admin
		if(IS_LIGHTNING_ENABLE)
			ADMIN.change_user_access_to_admin_on_lightening
		else
			ADMIN.change_user_access_to_admin_on_classic
		end
	end


	# to change the user access type to "admin" type, with in user administration section, in SF lightning
	def ADMIN.change_user_access_to_admin_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.change_user_access_to_admin_on_classic
		end
	end


	# to change the user access type to "admin" type, with in user administration section, in SF classic
	def ADMIN.change_user_access_to_admin_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				find(:xpath, $admin_standard_user_type_dropdown,:visible => true,:wait => 40).click
				find(:xpath, $admin_user_type_dropdown,:visible => true,:wait => 40).click
			end
		end
	end


	# to save a user after making changes in its information/configuration
	def ADMIN.save_user_on_Store
		if(IS_LIGHTNING_ENABLE)
			ADMIN.save_user_on_Store_on_lightening
		else
			ADMIN.save_user_on_Store_on_classic
		end
	end


	# to save a user after making changes in its information/configuration, in SF lightning
	def ADMIN.save_user_on_Store_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
			ADMIN.save_user_on_Store_on_classic
		end
	end


	# to save a user after making changes in its information/configuration, in SF classic
	def ADMIN.save_user_on_Store_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				find(:xpath, $admin_user_save_button_on_store,:visible => true,:wait => 40).click
				UTIL.min_wait
			end
		end
	end


	# to assert the validation message for standard user access type on administration tab
	# returns true if user doesn't have permission to view the  administration tab
	def ADMIN.verify_standard_user_access_for_administration_tab
		if(IS_LIGHTNING_ENABLE)
			ADMIN.verify_standard_user_access_for_administration_tab_on_lightening
		else
			ADMIN.verify_standard_user_access_for_administration_tab_on_classic
		end
	end


	# to assert the validation message for standard user access type on administration tab, in SF lightning
	# returns true if user doesn't have permission to view the  administration tab
	def ADMIN.verify_standard_user_access_for_administration_tab_on_lightening
		within_frame(find(:xpath, $admin_lightning_frame)) do
				ADMIN.verify_standard_user_access_for_administration_tab_on_classic
		end
	end


	# to assert the validation message for standard user access type on administration tab, in SF classic
	# returns true if user doesn't have permission to view the  administration tab
	def ADMIN.verify_standard_user_access_for_administration_tab_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				return page.has_xpath?$admin_swagiq_tools_error_msg
				#return page.has_xpath?("//h3[contains(text(), 'You are not authorized to view that resource.')]")
			end
		end
	end
end
