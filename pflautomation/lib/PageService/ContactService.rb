# Copyright PFL, All rights reserved.
# Any unauthorized use, copying or sale of the above may constitute an infringement of copyright and may
# result in criminal or other legal proceedings.

module CON
extend RSpec::Matchers
extend Capybara::DSL

###################################################
# Cantact object locators
###################################################
$con_first_name = "//label[contains(text(), 'First Name')]/../following-sibling::td[1]//input"
$con_last_name = "//label[contains(text(), 'Last Name')]/../following-sibling::td[1]//input"
$con_title = "//label[contains(text(), 'Title')]/../following-sibling/::td[1]//input"
$con_email = "//label[contains(text(), 'Email')]/../following-sibling::td[1]//input"
$con_phone = "//label[text()='Phone']/../following-sibling::td[1]//input"
$con_address_mailing_city = "//label[contains(text(), 'Mailing City')]/../following-sibling::td[1]//input"
$con_address_mailing_country = "//label[contains(text(), 'Mailing Country')]/../following-sibling::td[1]//input"
$con_address_mailing_state = "//label[contains(text(), 'Mailing State/Province')]/../following-sibling::td[1]//input"
$con_address_mailing_street = "//label[contains(text(), 'Mailing Street')]/../following-sibling::td[1]//textarea"
$con_address_mailing_zipcode = "//label[contains(text(), 'Mailing Zip/Postal Code')]/../following-sibling::td[1]//input"
$con_send_marketing_button = "//*[contains(@title, 'Send Marketing Materials')]"
$con_send_swag_select_address = "//span[contains(text(), 'Contact Address')]/ancestor::div[1]"
$con_send_swag_use_this_address_button = "//button[contains(text(), 'this address')]/..//button[1]"
$con_send_swag_coffee_mug_gift = "//div[contains(text(), 'Coffee Mug')]/../..//div[1]//img"
$con_on_canvas_ui_send_swag_button = "//button[contains(text(), 'Send Swag')]"
$con_set_product_filter = "//*[@id='ProductFilter']"     
$con_search_bar_send_swag = "input[placeholder='Enter Text to Filter']"
$con_canvas_outerframe = "//div[@id ='canvas']//iframe"
$con_canvas_innerframe = "//div[@id ='canvasapp']//iframe"
$con_canvas_ok = "//button[contains(text(), 'OK')]"
$con_within_body = "//*[@id='bodyCell']"
$con_swag_iq_order_related_list_section = "//h3[contains(text(), 'SwagIQ Order')]/ancestor::div[1]/../.."
$con_swag_iq_activity_history_task_related_list_section = "//h3[contains(text(), 'Activity History')]/ancestor::div[1]/../.."
$con_swag_iq_open_activities_task_related_list_section = "//h3[contains(text(), 'Open Activities')]/ancestor::div[1]/../.."
$con_campaign_history_related_list_section = "//h3[contains(text(), 'Campaign History')]/ancestor::div[1]/../.."
$con_campaign_history_related_list_section_sflt = "//div[@class='container forceRelatedListSingleContainer']//span[@title='Campaign History']"
$con_all_contact_drop_down = "//select[@name='fcf']"
$con_all_contact_option_value = "//option[contains(text(),'All Contacts')]"
$con_search_program = "//input[@id = 'ProductFilter']"
$con_send_marketing_next_button = "//button[contains(text(), 'Next >')]"
$con_send_marketing_confirmation_msg = "//input[@id='confirmation']"
$con_send_marketing_materials_button = "(//button[@id = 'sendButton'])[2]"
$con_tab_contacts = "Contacts"
$con_send_swag_validation_msg_phone_is_required = "Phone is required."
$con_send_swag_confirmation_msg = "You will receive a follow-up task once it has been delivered."
$con_order_status_submitted = "Submitted"
$con_PFL_auto_contact_option_value = "//option[contains(text(),'PFL Auto Contact')]"
$con_contact_address_box = "//div//h1//span[contains(.,'Contact Address')]"
$con_swag_last_sent_date = "//td[contains(.,'Swag Last Sent Date')]/following-sibling::td"
$con_swag_last_sent_date_lightng = "//button[@title='Edit Swag Last Sent Date']"
$con_swag_last_sent_date_text_box = "//td[contains(.,'Swag Last Sent Date')]/following-sibling::td/div/input"
$con_swag_last_sent_date_text_box_lightening = "//label/span[contains(.,'Swag Last Sent Date')]/../following-sibling::div/input"
$con_swag_last_sent_date_read_text_box_lightening = "(//span[contains(.,'Swag Last Sent Date')] //following::span)[2]"
$con_tab_contacts = "Contacts"
$con_send_swag_validation_msg_phone_is_required = "Phone is required."
# $con_send_swag_confirmation_msg = "You will receive a follow-up task once it has been delivered."
$con_first_item_to_select_send_swag = "(//div[@class='box-title'])[1]"
$con_next_button_gift_store = "(//div[@id='customize-left']//button[contains(.,'Next')])[1]"
$con_gift_store_I_accept_tc_checkbox = "//div/label[contains(.,'I confirm that everything is correct and approve this proof.')]"
$con_gift_center_send_marketing_material = "//div[@id='disclaimer']/../button[contains(.,'Send Marketing Materials')]"
$con_send_swag_other_address = "//button[contains(text(), 'Other Address')]"
$con_full_name = "PFL Auto_Contact"
$standard_user_name = "Standard_User, PFL_Auto"
$standard_user_first_name = "PFL_Auto"
$standard_user_first_name1 = "Nishant"
$standard_user_first_name2 = "Automation"
$standard_user_full_name1 = "Nishant, Standard_User"
$standard_user_last_name = "Standard_User"
$standard_user_full_name = "PFL_Auto Standard_User"
$standard_user_full_name1_lgt = "Nishant Standard_User"
$admin_user_firsr_name = "Mohit_Admin"
$con_no_product_available_msg = "//label[contains(text(),'You do not have any products available to order. Please contact your SwagIQ Admin.')]"
$con_edit_button = "//td[contains(@class,'pbButtonb')]//input[contains(@value,'Edit')]"
$con_save_button = "//td[contains(@class,'pbButtonb')]//input[contains(@value,'Save')]"
$con_standard_profile_name = "Standard User"
$bd_unlicensed_user_name = "user_4, Automation"
$con_bd_auto_contact_first_name = "PFL"
$con_bd_auto_contact_last_name = "Auto_Contact"
$con_do_not_swag_back_button = "//button[text()='Back']"
$con_status_picklist_under_tracking_information_relatedlist = "//h3[contains(text(),'Tracking Information')]/../following-sibling::div[1]//tr[3]//td[2]//select"
$con_order_status_order_confirmed = "Order Confirmed"
$con_order_status_shipped = "Shipped"
$con_order_status_delivered = "Delivered"
$con_lightng_swag_iq_order_view_all = "//span[contains(@title, 'SwagIQ Order')]/ancestor::h2/ancestor::div[contains(@class, 'RelatedListSingleContainer')]//span[contains(text(), 'View All')]"
$con_lightning_new_button = "//button[contains(@title ,'Save')][2]"
$con_first_name1 = "First Name"
$con_last_name1 = "Last Name"
$con_Title = "Title"
$con_email = "Email"
#$con_phone = "Phone"
$con_Mailing_City = "Mailing City"
$con_Mailing_Country = "Mailing Country"
$con_Mailing_state = "Mailing State/Province"
$con_error_city_is_required = "//div/span[contains(.,'City is required.')]"
$con_error_state_is_required = "//div/span[contains(.,'State is required.')]"
$con_error_phone_is_required = "//div/span[contains(.,'Phone is required.')]"
$con_other_city_field = "input-City"
$con_other_state_field = "input-State"
$con_other_phone_field = "input-Phone"
$con_other_address_line1 = "input-AddressLine1"
$con_other_address_line2 = "input-AddressLine2"
$con_other_postal_code  = "input-PostalCode"
$con_other_postal_country = "input-Country"
$con_other_phone_number = "input-Phone"
$con_other_company_name = "input-Company"
$con_other_address_line1_value = "Flat No 305 J Sons Felicia Cross Layout Singarr"
$con_other_address_line2_value = "Flat No 305 J Sons Felicia Cross Layout Singarr"
$con_other_city_field_value = "Flat No 305 J Sons Felicia Cross Layout Singarr"
$con_other_state_field_value = "Flat No 305 J Sons Felicia Cross Layout Singarr"
$con_other_postal_code_value = 101010101010
$con_other_postal_country_value = "INDIAINDIAINDIAINDIAINDIA"
$con_other_phone_number_value = 01412525250141252525
$con_con_other_company_name_value = "MetacubeMetacubeMetacubeMetacubeMetacube"
$con_error_other_name_address1 = "The shipping label has a limit of 35 characters for Address Line 1."
$con_error_other_name_address2 = "The shipping label has a limit of 34 characters for Address Line 2."
$con_error_other_name_city = "The shipping label has a limit of 35 characters for City."
$con_error_other_name_state = "The shipping label has a limit of 30 characters for State."
$con_error_other_name_country = "The shipping label has a limit of 20 characters for Country."
$con_error_other_name_phone_name = "The shipping label has a limit of 16 characters for Phone."
$con_error_other_name_company_name = "The shipping label has a limit of 35 characters for Company."
$con_error_other_name_postal_code = "The shipping label has a limit of 10 characters for Postal Code."
$con_other_address_line1_valid_value = "100 PFL Way"
$con_other_address_line2_valid_value = "PFL Office"
$con_other_city_field_valid_value = "Livingston"
$con_other_state_field_valid_value = "Montana"
$con_other_postal_code_valid_value = "90006"
$con_other_postal_country_valid_value = "USA"
$con_other_phone_number_valid_value = "9342323333"
$con_con_other_company_name_valid_value = "PFL"
$con_custom_use_this_address = "(//footer/button[contains(.,'this address')])[1]"
$con_account_billing_send_swag_select_address = "(//span[contains(text(), 'Account Billing Address')])[1]"
$con_edit_checkbox_donotswag = "//label[contains(text(),'Do Not Swag')]/../following-sibling::td/input[@type='checkbox']"
$con_do_not_swag_checkbox = "//td[contains(text(),'Do Not Swag')]/..//img[contains(@title,'Checked')]"
$con_do_not_swag_uncheck = "//td[contains(text(),'Do Not Swag')]/..//img[contains(@title,'Not Checked')]"
$con_do_not_swag_unchecked_lightning = "//img[contains(@src,'/auraFW/resources/aura/s.gif') and @class=' unchecked']"
$con_do_not_swag_checked_lightning2 = "//img[contains(@class,' checked') and @alt='True']"
$con_do_not_swag_checked_lightning = "//span[contains(text(),'Do Not Swag')]/../following-sibling::input"
$con_editcontact_pagelabel_lightning = "//h2[text()='Edit Contact']"
$con_tab_swag_IQ_tools = "SwagIQ Tools"
$con_select_an_item_label = "//span/b[contains(.,'SwagIQ - Select an Item')]"
$con_lightning_frame = "//div[contains(@class, 'oneAlohaPage')]//iframe"
$con_view_pfl = "PFL Auto Contact"
$con_search_bar_on_select_swag = "//input[@placeholder='Enter Text to Filter']"
$con_detail_button_lightning = "(//a[contains(@title,'Details')]//following-sibling::span)[1]"
$con_save_button_lightnin = "//button[contains(@title ,'Save')][2]"
$con_edit_button_lightning = "//div[text()='Edit']"
$con_product_availaibility_check = "//label[contains(text(), '0 Available')]"
$con_send_swag_not_avbl = "//h2[contains(text(), 'Send Swag not available')]"
$con_send_swag_msg_for_inactive_progrm = "//label[text()='No products found.']"
# $con_edit_checkbox_uncheck = "//img[contains(@class,'unchecked')]"

#########################################
# Contact object setter and getter methods
##########################################

	# to enter the values in text fields on behalf of their corresponding labels, in SF lightning
	# @param label String = value of the label, which you are passing here in xpath in order to find the text field
	# @input_value = text value, which you want to fill up in text box
	def CON.set_value_using_label_on_lightning label, input_value
		UTIL.re_execute_script_block do
			find(:xpath, "//span[contains(text() , '"+label+"')]/ancestor::label/..//input[1]").set input_value
		end
		UTIL.page_load_waiting
	end

	# to enter the values in text fields on behalf of their corresponding labels, in SF classic
	# @param label String = value of the label, which you are passing here in xpath in order to find the text field
	# @input_value = text value, which you want to fill up in text box
	def CON.set_value_using_label_on_classic label, input_value
		if(IS_LIGHTNING_ENABLE == true)

		else
			UTIL.re_execute_script_block do
				find(:xpath, "//label[contains(text(), '"+label+"')]/../following-sibling::td[1]//input").set input_value
			end
			UTIL.page_load_waiting
		end
	end

	# to click on save button for a contact, after creation/editing, in SF lightning
	def CON.click_lightning_save_button
		UTIL.re_execute_script_block do
			find(:xpath, "//span[contains(text() , '"+label+"')]/ancestor::label/..//input[1]").set input_value
		end
		UTIL.page_load_waiting
	end

	# to enter first name while creating a new contact
	# @param name_value String = value of the first name of the contact
	def CON.set_first_name name_value
		if(IS_LIGHTNING_ENABLE == true)
			CON.set_value_using_label_on_lightning $con_first_name, name_value
		else
			UTIL.re_execute_script_block do
				find(:xpath, $con_first_name).set name_value
			end
			UTIL.min_wait
		end
	end

	# to enter last name while creating a new contact
	# @param name_value String = value of the last name of the contact
	def CON.set_last_name name_value
		UTIL.re_execute_script_block do
			find(:xpath, $con_last_name).set name_value
		end
	end

	# to enter title name while creating a new contact
	# @param title_value String = value of the title of the contact
	def CON.set_title_value title_value
		UTIL.re_execute_script_block do
			find(:xpath, $con_title).set title_value
		end
	end

	# to enter email while creating a new contact
	# @param mail String = value of the mail of the contact
	def CON.set_email_value mail
		UTIL.re_execute_script_block do
			find(:xpath, $con_email).set mail
		end
	end

	# to enter mailing address street while creating a new contact
	# @param street String = value of the mailing address street of the contact
	def CON.set_address_mailing_street street
		UTIL.re_execute_script_block do
			find(:xpath, $con_address_mailing_street).set street
		end
	end

	# to enter mailing address city while creating a new contact
	# @param city String = value of the mailing address city of the contact
	def CON.set_address_mailing_city city
		UTIL.re_execute_script_block do
			find(:xpath, $con_address_mailing_city).set city
		end
	end

	# to enter mailing address state while creating a new contact
	# @param state String = value of the mailing address state of the contact
	def CON.set_address_mailing_state state
		UTIL.re_execute_script_block do
			find(:xpath, $con_address_mailing_state).set state
		end
	end

	# to enter mailing address zipcode while creating a new contact
	# @param zipcode String = value of the mailing address zipcode of the contact
	def CON.set_address_mailing_zipcode zipcode
		UTIL.re_execute_script_block do
			find(:xpath, $con_address_mailing_zipcode).set zipcode
		end
	end


	# to enter mailing address country while creating a new contact
	# @param country String = value of the mailing address country of the contact
	def CON.set_address_mailing_country country
		UTIL.re_execute_script_block do
			find(:xpath, $con_address_mailing_country).set country
		end
	end


	# to enter mailing address phone while creating a new contact
	# @param phone_value String = value of the mailing address phone of the contact
	def CON.set_phone phone_value
		UTIL.re_execute_script_block do
			find(:xpath, $con_phone).set phone_value
		end
	end


	# to open the contact on contact page
	# @param first_name String = first name of the contact in string form
	# @param last_name String = last name of the contact in string form
	def CON.open_contact first_name, last_name
		full_name = first_name + " "+ last_name
		logger.info "Contact Name #{name}"
		if(IS_LIGHTNING_ENABLE)
			find(:xpath, "//a[contains(@title ,'"+full_name+"')]").click
		else
			UTIL.re_execute_script_block do
				UTIL.min_wait
				find(:xpath, "//span[contains(text(), '"+last_name+"')]/ancestor::div[contains(@id, 'FULL_NAME')]",:visible =>true ,:wait => 30).click
				UTIL.page_load_waiting
			end
		end
	end


	# to click on "select all" contact view filter on contact page
	def CON.select_all_contact_view
		UTIL.re_execute_script_block do
			find(:xpath, $con_all_contact_drop_down).click
			UTIL.page_load_waiting
			find(:xpath, $con_all_contact_option_value).click
			UTIL.page_load_waiting
		end
	end


	# to click on send marketing material button, available on every contact detail page
	def CON.click_on_send_marketing_button
		UTIL.re_execute_script_block do
			find(:xpath, $con_send_marketing_button).click
		end
		UTIL.min_wait
	end


	# to click on "contact address" box/block, which appears after clicking on "send marketing material" button
	def CON.select_contact_Address
		if(IS_LIGHTNING_ENABLE)
			CON.select_contact_Address_on_lightening
		else
			CON.select_contact_Address_on_classic
		end
	end


	# to click on "contact address" box/block, which appears after clicking on "send marketing material" button, in SF classic
	def CON.select_contact_Address_on_classic
		UTIL.re_execute_script_block do
			find(:xpath, $con_send_swag_select_address).click
		end
		UTIL.min_wait
	end


	# to click on "contact address" box/block, which appears after clicking on "send marketing material" button, in SF lightning
	def CON.select_contact_Address_on_lightening
		within_frame(find(:xpath, $con_lightning_frame)) do
			logger.info "entered in lightning frame successfull for contact address"
			CON.select_contact_Address_on_classic
		end
	end


	# to click on "use this address" button, which becomes enable after selecting the address type(contact address/account address/account shipping address) etc
	def CON.click_use_this_address_buttons
		if(IS_LIGHTNING_ENABLE)
			CON.click_use_this_address_buttons_on_lightning
		else
			logger.info "In classsic Version."
			CON.click_use_this_address_buttons_on_classic
		end
	end


	# to click on "use this address" button, which becomes enable after selecting the address type(contact address/account address/account shipping address) etc, in SF classic
	def CON.click_use_this_address_buttons_on_classic
		UTIL.re_execute_script_block do
			find(:xpath, $con_send_swag_use_this_address_button).click
		end
		#UTIL.page_load_waiting
		UTIL.med_wait # soon we will find out dynamic wait solution
	end


	# to click on "use this address" button, which becomes enable after selecting the address type(contact address/account address/account shipping address) etc, in SF lightning
	def CON.click_use_this_address_buttons_on_lightning
		within_frame(find(:xpath, $con_lightning_frame)) do
			CON.click_use_this_address_buttons_on_classic
		end
	end


	# during the last stage of swag selection, this method is useful to click on coffee mug image(which is a swag actually)
	def CON.select_coffee_mug
		UTIL.re_execute_script_block do
			within_frame(find(:xpath, $con_canvas_outerframe)) do
				within_frame(find(:xpath, $con_canvas_innerframe)) do
					find(:xpath, $con_send_swag_coffee_mug_gift).click
				end
			end
		end
		UTIL.page_load_waiting
		UTIL.med_wait # soon we will find out dynamic wait solution
	end


	# to click on "send marketing materials" button, available on canvas UI during last stage of swag selection
	def CON.click_canvas_ui_send_swag_button
		UTIL.re_execute_script_block do
			within_frame(find(:xpath, $con_canvas_outerframe)) do
				within_frame(find(:xpath, $con_canvas_innerframe)) do
					find(:xpath, $con_on_canvas_ui_send_swag_button).click
				end
			end
		end
		UTIL.page_load_waiting	
	end


		# unused method
	def CON.set_product_filter product_value
		UTIL.re_execute_script_block do
			within_frame(find(:xpath, $con_canvas_outerframe)) do
				within_frame(find(:xpath, $con_canvas_innerframe)) do
					find(:xpath, $con_set_product_filter).set product_value
				end
			end
		end
		UTIL.page_load_waiting
		UTIL.max_wait # soon we will find out dynamic wait solution
	end


	# click on "OK" confirmation button, which comes up at final stage of send swag
	def CON.click_canvas_ok
		if(IS_LIGHTNING_ENABLE)
			CON.click_canvas_ok_on_lightening
		else
			CON.click_canvas_ok_on_classic
		end
	end


	# click on "OK" confirmation button, which comes up at final stage of send swag, in SF classic
	def CON.click_canvas_ok_on_classic
		ADMIN.wait_object_load $con_canvas_ok
		#UTIL.re_execute_script_block do
		begin
			within_frame(find(:xpath, $con_canvas_outerframe)) do
				within_frame(find(:xpath, $con_canvas_innerframe))do
					find(:xpath, $con_canvas_ok).click
					logger.info 'clicked on canvas OK button'
					page.driver.browser.switch_to.default_content
				end
			end
		rescue Exception=>e
			puts "Exception => #{e}"
			logger.error "Exception => #{e}"
		end
		#page.driver.browser.switch_to.default_content
		UTIL.wait_object_appear $con_send_marketing_button
	end


	# click on "OK" confirmation button, which comes up at final stage of send swag, in SF lightning
	def CON.click_canvas_ok_on_lightening
		within_frame(find(:xpath, $con_lightning_frame)) do
			CON.click_canvas_ok_on_classic
		end
	end


	# to assert the send swag confirmation message, which appears on canvas page, afer successfull send swag
	def CON.verify_send_swag_confirmation_msg
		if(IS_LIGHTNING_ENABLE)
			CON.verify_send_swag_confirmation_msg_on_lightening
		else
			CON.verify_send_swag_confirmation_msg_on_classic
		end
	end


	# to assert the send swag confirmation message, which appears on canvas page, afer successfull send swag, in SF classic
	def CON.verify_send_swag_confirmation_msg_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				UTIL.re_execute_script_block do
					return page.has_text?($con_send_swag_confirmation_msg)
				end	
			end
		end
	end


	# to verify the send swag confirmation message, which appears on canvas page, afer successfull send swag, in SF lightning
	def CON.verify_send_swag_confirmation_msg_on_lightening
		within_frame(find(:xpath, $con_lightning_frame)) do
			CON.verify_send_swag_confirmation_msg_on_classic
		end
	end

	# to verify the order is created and available under swagiq order related list
	# @param product_value String = name of the product which you have selected during send swag
	# @param program_name String = name of the program which you have selected during send swag
	# @param order_status String = status of the order after its creation(Submitted/pending/cancel etc)

	def CON.verify_swag_iq_order_status_under_related_list product_value, program_name, order_status
		program_title = program_name + " - " + product_value
		if(IS_LIGHTNING_ENABLE)
			UTIL.page_refresh
			find(:xpath, $con_lightng_swag_iq_order_view_all).click
			UTIL.page_load_waiting
		    return page.has_xpath? "//*[contains(text(), '"+order_status+"')]/ancestor::tr[1]//a[contains(text(), '"+program_title+"')]/ancestor::tr[1]"
		else
			UTIL.re_execute_script_block do
				within(find(:xpath, $con_swag_iq_order_related_list_section)) do
					  return page.has_xpath? "//td[contains(text(), '"+order_status+"')]/ancestor::tr[1]//a[contains(text(), '"+program_title+"')]/ancestor::tr[1]"
				end
			end
		end
	end



	def CON.verify_swag_iq_task_under_related_list product_value, program_name, order_status
		order_confirmed_task = 'SwagIQ Order Placed - ' + $con_full_name + " - " + program_name + " - " + product_value
		order_shipped_task = 'SwagIQ Order Shipped - ' + $con_full_name + " - " + program_name + " - " + product_value
		order_delivered_task = 'SwagIQ Order Delivered - ' + $con_full_name + " - " + program_name + " - " + product_value
		if(IS_LIGHTNING_ENABLE)
			  	if order_status.eql? 'Order Confirmed'
				  	puts 'order confirmed'
				  	return page.has_xpath? "//a[contains(text(), '"+order_confirmed_task+"')]"
			  	elsif order_status.eql? 'Shipped'
				  	puts 'shipped'
				  	return page.has_xpath? "//a[contains(text(), '"+order_shipped_task+"')]"
			  	elsif order_status.eql? 'Delivered'
				  	puts 'delivered'
				  	return page.has_xpath? "//a[contains(text(), '"+order_delivered_task+"')]"
				end
		else
			UTIL.re_execute_script_block do
				UTIL.scroll_to $con_swag_iq_activity_history_task_related_list_section
				within(find(:xpath, $con_swag_iq_activity_history_task_related_list_section)) do
						puts 'activity history'
					  	if order_status.eql? 'Order Confirmed'
						  	logger.info 'SwagIQ Order Confirmed'
						  	return page.has_xpath? "//h3[contains(text(), 'Activity History')]/ancestor::div[1]/../..//a[contains(text(), '"+order_confirmed_task+"')]/ancestor::tr[1]"
							# //tr/th[contains(text(), 'Subject')]/../following-sibling::tr[1]
					  	elsif order_status.eql? 'Shipped'
						  	logger.info 'SwagIQ Order Shipped'
						  	return page.has_xpath? "//h3[contains(text(), 'Activity History')]/ancestor::div[1]/../..//a[contains(text(), '"+order_shipped_task+"')]/ancestor::tr[1]"
					  	end	
				UTIL.scroll_to $con_swag_iq_open_activities_task_related_list_section
				within(find(:xpath, $con_swag_iq_open_activities_task_related_list_section)) do
					  	if order_status.eql? 'Delivered'
						  	logger.info 'SwagIQ Order Delivered'
						  	return page.has_xpath? "//h3[contains(text(), 'Open Activities')]/ancestor::div[1]/../..//a[contains(text(), '"+order_delivered_task+"')]/ancestor::tr[1]"
						end
					end 
				end
			end
		end
	end



	# to delete an order available under swag iq order related list
	# @param product_value String = name of the product which you have selected during send swag
	# @param program_name String = name of the program which you have selected during send swag
	# @param order_status String = status of the order after its creation(Submitted/pending/cancel etc)
	def CON.delete_swag_iq_order_status_under_related_list product_value, program_name, order_status
		if(IS_LIGHTNING_ENABLE)
			CON.delete_swag_iq_order_status_under_related_list_on_lightening product_value, program_name, order_status
		else
			CON.delete_swag_iq_order_status_under_related_list_on_classic product_value, program_name, order_status
		end
	end


	def CON.delete_swag_iq_order_status_under_related_list_on_lightening product_value, program_name, order_status
		program_title = program_name + " - " + product_value
		if page.has_xpath? $con_lightng_swag_iq_order_view_all
			find(:xpath, $con_lightng_swag_iq_order_view_all,:wait => 20).click
				if(page.has_xpath?("(//*[contains(text(), '"+order_status+"')]/ancestor::tr[1]//a[contains(text(), '"+program_title+"')]/ancestor::tr[1]//span[contains(text(), 'Show More')]/..)[1]"))
					find(:xpath, "(//*[contains(text(), '"+order_status+"')]/ancestor::tr[1]//a[contains(text(), '"+program_title+"')]/ancestor::tr[1]//span[contains(text(), 'Show More')]/..)[1]").click
					find(:xpath, "//a[contains(@title, 'Delete')]").click
					find(:xpath, "//span[contains(text(), 'Delete')]",:wait => 20).click
					find(:xpath,"//nav[@aria-label='Breadcrumbs']//span[contains(.,'PFL Auto_Contact')]",:wait => 20).click
				else
				logger.info 'No SwagIQ Order Available'
			end
		else 
			logger.info 'no order exists'
		end
	end

	def CON.delete_swag_iq_order_status_under_related_list_on_classic product_value, program_name, order_status
		program_title = program_name + " - " + product_value
		UTIL.scroll_to $con_swag_iq_order_related_list_section
		within(find(:xpath, $con_swag_iq_order_related_list_section)) do
			if(page.has_xpath?("//td[contains(text(), '"+order_status+"')]/ancestor::tr[1]//a[contains(text(), '"+program_title+"')]/ancestor::tr[1]//a[contains(text(), 'Del')]"))
				UTIL.wait_object_appear "//td[contains(text(), '"+order_status+"')]/ancestor::tr[1]//a[contains(text(), '"+program_title+"')]/ancestor::tr[1]//a[contains(text(), 'Del')]"
				find(:xpath, "//td[contains(text(), '"+order_status+"')]/ancestor::tr[1]//a[contains(text(), '"+program_title+"')]/ancestor::tr[1]//a[contains(text(), 'Del')]").click
				SFL.alert_ok
				UTIL.page_load_waiting
				logger.info 'order deleted successfully'
			else
				logger.info 'No SwagIQ Order Available'
			end
		end
		
	end

	# to verify the campaign's availability under campaign related list, available on contact detail page
	# @param campaign_name String = name of the campaign, which you want to verify on contact page
	def CON.verify_associated_campaign_status_under_related_list_section campaign_name
		if(IS_LIGHTNING_ENABLE)
			 CON.verify_associated_campaign_status_under_related_list_section_in_lightning campaign_name
		else
			CON.verify_associated_campaign_status_under_related_list_section_in_classic campaign_name
		end
	end

	# to verify the campaign's availability under campaign related list, available on contact detail page, in  SF lightning
	# @param campaign_name String = name of the campaign, which you want to verify on contact page
	def CON.verify_associated_campaign_status_under_related_list_section_in_lightning campaign_name
		UTIL.re_execute_script_block do
			UTIL.page_refresh
			#UTIL.press_keys_on_page :f5
			UTIL.scroll_to $con_campaign_history_related_list_section_sflt
			within(find(:xpath, $con_campaign_history_related_list_section_sflt)) do
				return expect(page).to have_xpath("//a[contains(text(), '"+campaign_name+"')]")
			end
		end
	end

	# to verify the campaign's availability under campaign related list, available on contact detail page, in SF classic
	# @param campaign_name String = name of the campaign, which you want to verify on contact page
	def CON.verify_associated_campaign_status_under_related_list_section_in_classic campaign_name
		UTIL.scroll_to $con_campaign_history_related_list_section
		UTIL.re_execute_script_block do
			within(find(:xpath, $con_campaign_history_related_list_section)) do
					return expect(page).to have_xpath("//a[contains(text(), '"+campaign_name+"')]")
			end
		end
	end


	# to click on an order available in swag iq order related list
	# @param gift_info String = name of the gift
	# @param order_status String = status of the order(Submitted/pending/cancel etc)
	def CON.open_swag_iq_order_in_related_list gift_info, order_status
		UTIL.re_execute_script_block do
			within(find(:xpath, $con_swag_iq_order_related_list_section)) do
				find(:xpath, "//td[contains(text(), '"+order_status+"')]/ancestor::tr[1]//a[contains(text(), '"+gift_info+"')]/ancestor::tr[1]//th[1]//a").click
			end
		end
		UTIL.page_load_waiting
		UTIL.wait_object_appear $swiqodr_page_title
	end

	# verify program name on gift selection screen(canvas page of program+giftname combination)
	# @param program_name String = name of the program, which you are searching on gift selection screen after clicking on send marketing materials page
	def CON.verify_program_on_contact_send_marketing_page program_name
		if(IS_LIGHTNING_ENABLE)
			CON.verify_program_on_contact_send_marketing_page_on_lightening program_name
		else
			CON.verify_program_on_contact_send_marketing_page_on_classic program_name
		end
	end

	# verify program name on gift selection screen(canvas page of program+giftname combination), on SF classic
	# @param program_name String = name of the program, which you are searching on gift selection screen after clicking on send marketing materials page
	def CON.verify_program_on_contact_send_marketing_page_on_classic program_name
		within_frame(find(:xpath, $con_canvas_outerframe,:wait => 30))do
			within_frame(find(:xpath,$con_canvas_innerframe,:wait => 30))do
				UTIL.scroll_to $con_set_product_filter
				find(:xpath, $con_select_an_item_label).double_click
				script = "$('#ProductFilter').val('#{program_name}');"
  	 			page.driver.browser.execute_script(script)
				UTIL.min_wait
				UTIL.re_execute_script_block do
					return page.has_xpath?("//label[contains(text(), '"+program_name+"')]/ancestor::div[@class = 'box-title']")
					#return expect(page).to have_xpath("//label[contains(text(), '"+program_name+"')]/ancestor::div[@class = 'box-title']")
				end	
			end
		end
	end

	# verify program name on gift selection screen(canvas page of program+giftname combination), on SF lightning
	# @param program_name String = name of the program, which you are searching on gift selection screen after clicking on send marketing materials page
	def CON.verify_program_on_contact_send_marketing_page_on_lightening program_name
		within_frame(find(:xpath, $admin_lightning_frame,:wait => 30)) do
			CON.verify_program_on_contact_send_marketing_page_on_classic program_name
		end
	end	

	# verify inactive program name on gift selection screen(canvas page of program+giftname combination)
	# @param program_name String = name of the inactive program, which you are searching on gift selection screen after clicking on send marketing materials page
	def CON.verify_inactive_program_on_contact_send_marketing_page program_name
		if(IS_LIGHTNING_ENABLE)
			CON.verify_inactive_program_on_contact_send_marketing_page_on_lightening program_name
		else
			CON.verify_inactive_program_on_contact_send_marketing_page_on_classic program_name
		end
	end	

	def CON.verify_inactive_program_on_contact_send_marketing_page_on_classic program_name
		within_frame(find(:xpath, $con_canvas_outerframe,:wait => 30))do
			within_frame(find(:xpath,$con_canvas_innerframe,:wait => 30))do
				UTIL.scroll_to $con_set_product_filter
				find(:xpath, $con_select_an_item_label).double_click
				script = "$('#ProductFilter').val('#{program_name}');"
  	 			page.driver.browser.execute_script(script)
				UTIL.min_wait
				UTIL.re_execute_script_block do
					return expect(page).to have_xpath($con_send_swag_msg_for_inactive_progrm)
				end	
			end
		end
	end

	def verify_inactive_program_on_contact_send_marketing_page_on_lightening program_name
		within_frame(find(:xpath, $admin_lightning_frame,:wait => 30)) do
			CON.verify_inactive_program_on_contact_send_marketing_page_on_classic program_name
		end
	end
	
	# to click on program name, on program selection screen, during send marketing materials
	# @param program_name String = name of the program which is part of the gift name(program name + product name compbination)
	# @product_name String = name of the product in your gift name's combination
	def CON.click_program_on_contact_send_marketing_page program_name,product_name
		if(IS_LIGHTNING_ENABLE)
			CON.click_program_on_contact_send_marketing_page_on_lightening program_name,product_name
		else
			CON.click_program_on_contact_send_marketing_page_on_classic program_name,product_name
		end
	end

	# to click on program name, on program selection screen, during send marketing materials, in SF classic
	# @param program_name String = name of the program which is part of the gift name(program name + product name compbination)
	# @product_name String = name of the product in your gift name's combination
	def CON.click_program_on_contact_send_marketing_page_on_classic program_name,product_name
	    program_title = program_name + " - " + product_name
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath, $con_canvas_innerframe))do
				UTIL.scroll_to $con_set_product_filter
			 	UTIL.wait_object_appear $con_select_an_item_label
				logger.info 'Entered in Program Send Swag Screen' 
				UTIL.re_execute_script_block do
					logger.info 'trying to enter the text in search bar' 
					script = "$('#ProductFilter').val('#{program_title}');"
  	 				page.driver.browser.execute_script(script)
					logger.info 'entered the search query'  
				end
				logger.info 'Entered find'
				UTIL.scroll_to "//label[contains(text(), '"+program_title+"')]/ancestor::div[@class = 'box-title']"
				UTIL.min_wait
				find(:xpath, "//label[contains(text(), '"+program_title+"')]/ancestor::div[@class = 'box-title']").click
				puts 'exit find'
				
			end
		end 
	end

	# to click on program name, on program selection screen, during send marketing materials, in SF lightning
	# @param program_name String = name of the program which is part of the gift name(program name + product name compbination)
	# @product_name String = name of the product in your gift name's combination
	def CON.click_program_on_contact_send_marketing_page_on_lightening program_name , product_name
		#program_title = program_name + " - " + product_name
		within_frame(find(:xpath, $con_lightning_frame,:wait => 30)) do
			CON.click_program_on_contact_send_marketing_page_on_classic program_name,product_name
		end
	end

	# to click on next button, which appears after selecting the gift on canvas page
	def CON.click_send_marketing_next_button
		if(IS_LIGHTNING_ENABLE)
			CON.click_send_marketing_next_button_on_lightening
		else
			CON.click_send_marketing_next_button_on_classic
		end
	end


	# to click on next button, which appears after selecting the gift on canvas page, in SF classic
	def CON.click_send_marketing_next_button_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.min_wait
				UTIL.scroll_to $con_send_marketing_next_button
				UTIL.wait_object_appear $con_send_marketing_next_button
				UTIL.re_execute_script_block do
					find(:xpath, $con_send_marketing_next_button,:wait => 30).click
				end
			end
		end
	end


	# to click on next button, which appears after selecting the gift on canvas page, in SF lightning
	def CON.click_send_marketing_next_button_on_lightening
		within_frame(find(:xpath, $con_lightning_frame)) do
			CON.click_send_marketing_next_button_on_classic
		end
	end


	# to click on confirmation checkbox, before sending the marketing material at final stage
	def CON.click_send_marketing_confirmation_msg
		if(IS_LIGHTNING_ENABLE)
			CON.click_send_marketing_confirmation_msg_on_lightening
		else
			CON.click_send_marketing_confirmation_msg_on_classic
		end
	end


	# to click on confirmation checkbox, before sending the marketing material at final stage, in SF classic
	def CON.click_send_marketing_confirmation_msg_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.min_wait
				UTIL.scroll_to $con_send_marketing_confirmation_msg
				UTIL.wait_object_appear $con_send_marketing_confirmation_msg
				UTIL.re_execute_script_block do
					find(:xpath, $con_send_marketing_confirmation_msg,:wait => 30).click
				end
			end
		end
	end


	# to click on confirmation checkbox, before sending the marketing material at final stage, in SF lightning
	def CON.click_send_marketing_confirmation_msg_on_lightening
		within_frame(find(:xpath, $con_lightning_frame)) do
			CON.click_send_marketing_confirmation_msg_on_classic
		end
	end


	# to click on send marketing materials button finally after selecting the checkbox of confirmation during send marketing material process
	def CON.click_send_marketing_materials_button
		if(IS_LIGHTNING_ENABLE)
			CON.click_send_marketing_materials_button_on_lightening
		else
			CON.click_send_marketing_materials_button_on_classic
		end
	end


	# to click on send marketing materials button finally after selecting the checkbox of confirmation during send marketing material process, in SF classic
	def CON.click_send_marketing_materials_button_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				find(:xpath, $con_send_marketing_materials_button,:wait => 30).click
				UTIL.min_wait
			end
		end
	end


	# to click on send marketing materials button finally after selecting the checkbox of confirmation during send marketing material process, in SF lightning
	def CON.click_send_marketing_materials_button_on_lightening
		within_frame(find(:xpath, $con_lightning_frame)) do
			CON.click_send_marketing_materials_button_on_classic
		end
	end


	# to verify the text "Send Swag not available", when "do not send swag" option is checked for a user
	def  CON.verify_send_swag_not_available
		if(IS_LIGHTNING_ENABLE)
			CON.verify_send_swag_not_available_on_lightning
		else
			CON.verify_send_swag_not_available_on_classic
		end
	end


	# to verify the text "Send Swag not available", when "do not send swag" option is checked for a user, in SF lightning
	def CON.verify_send_swag_not_available_on_lightning
		within_frame(find(:xpath, $con_lightning_frame)) do
			CON.verify_send_swag_not_available_on_classic
		end
	end


	# to verify the text "Send Swag not available", when "do not send swag" option is checked for a user, in SF classic
	def CON.verify_send_swag_not_available_on_classic
		# return expect(page).to have_xpath($con_send_swag_not_avbl) 
		return find(:xpath, $con_send_swag_not_avbl,:wait => 30).click
	end


	# to uncheck the "do not swag" checkbox, available on every contact detail page and save the changes
	def CON.set_do_not_swag_checkbox_as_unchecked
		if(IS_LIGHTNING_ENABLE)
			CON.set_do_not_swag_checkbox_as_unchecked_on_lightning
		else
			CON.set_do_not_swag_checkbox_as_unchecked_on_classic
		end
	end


	# to uncheck the "do not swag" checkbox, available on every contact detail page and save the changes, in SF lightning
	def CON.set_do_not_swag_checkbox_as_unchecked_on_lightning
			find(:xpath, $con_detail_button_lightning).click
			if page.has_xpath?($con_do_not_swag_checked_lightning2)
				find(:xpath, $con_edit_button_lightning).click
				find(:xpath, $con_do_not_swag_checked_lightning).click
				find(:xpath, $con_save_button_lightnin).click
				UTIL.min_wait
			end
	end


	# to uncheck the "do not swag" checkbox, available on every contact detail page and save the changes, in SF classic
	def CON.set_do_not_swag_checkbox_as_unchecked_on_classic
		if page.has_xpath?($con_do_not_swag_checkbox)
			find(:xpath, $con_edit_button).click
			find(:xpath, $con_edit_checkbox_donotswag).click
			#find(:xpath, "//label[contains(text(),'Do Not Swag')]/../..//td[4]/input").click
			find(:xpath, $con_save_button).click
			UTIL.min_wait
		end
	end


	# to check the "do not swag" checkbox, available on every contact detail page and save the changes
	def  CON.set_do_not_swag_checkbox_as_checked
		if(IS_LIGHTNING_ENABLE)
			CON.set_do_not_swag_checkbox_as_checked_on_lightning
		else
			CON.set_do_not_swag_checkbox_as_checked_on_classic
		end
	end


	# to check the "do not swag" checkbox, available on every contact detail page and save the changes, in SF lightning
	def CON.set_do_not_swag_checkbox_as_checked_on_lightning
			find(:xpath, $con_detail_button_lightning).click
			if page.has_xpath?($con_do_not_swag_unchecked_lightning)
				find(:xpath, $con_edit_button_lightning).click
				UTIL.min_wait
				find(:xpath, $con_editcontact_pagelabel_lightning).click
				find(:xpath, $con_do_not_swag_checked_lightning).click
				find(:xpath, $con_save_button_lightnin).click
				UTIL.min_wait
			end
	end


	# to check the "do not swag" checkbox, available on every contact detail page and save the changes, in SF classic
	def CON.set_do_not_swag_checkbox_as_checked_on_classic
		if page.has_xpath?($con_do_not_swag_uncheck)
			find(:xpath, $con_edit_button).click
			#find(:xpath, "//label[contains(text(),'Do Not Swag')]/../..//td[4]/input").click
			find(:xpath, $con_edit_checkbox_donotswag).click
			find(:xpath, $con_save_button).click
			UTIL.min_wait
		end
	end


	# to verify the product quantity while creating a program
	def CON.verify_program_product_quantity program_name
		if(IS_LIGHTNING_ENABLE)
			CON.verify_program_product_quantity_on_lightening program_name
		else
			CON.verify_program_product_quantity_on_classic program_name
		end
	end


	# to verify the product quantity for an already created program, in SF classic
	def CON.verify_program_product_quantity_on_classic program_name
		within_frame(find(:xpath, $con_canvas_outerframe))do
			within_frame(find(:xpath,$con_canvas_innerframe))do
				UTIL.scroll_to $con_search_program
				UTIL.wait_object_appear $con_select_an_item_label 
				script = "$('#ProductFilter').val('#{program_name}');"
  	 			page.driver.browser.execute_script(script)
				UTIL.page_load_waiting
				# return expect(page).to have_xpath($con_product_availaibility_check)
				return page.has_xpath?($con_product_availaibility_check)
			end
		end
	end


	# to verify the product quantity for an already created program, in SF lightning
	def CON.verify_program_product_quantity_on_lightening program_name
		within_frame(find(:xpath, $con_lightning_frame)) do
			CON.verify_program_product_quantity_on_classic program_name
		end
	end


	# to verify that no product is available when a user tries to send marketing material
	def CON.verify_no_product_available_on_send_swag
		if(IS_LIGHTNING_ENABLE)
			CON.verify_no_product_available_on_send_swag_on_lightening
		else
			CON.verify_no_product_available_on_send_swag_on_classic
		end
	end


	# to verify that no product is available when a user tries to send marketing material, in SF lightning
	def CON.verify_no_product_available_on_send_swag_on_lightening
		within_frame(find(:xpath, $con_lightning_frame)) do
			CON.verify_no_product_available_on_send_swag_on_classic
		end
	end


	# to verify that no product is available when a user tries to send marketing material, in SF classic
	def CON.verify_no_product_available_on_send_swag_on_classic
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				UTIL.scroll_to $con_set_product_filter
				UTIL.wait_object_appear $con_select_an_item_label 
				UTIL.re_execute_script_block do
					return expect(page).to have_xpath($con_no_product_available_msg)
				end
			end
		end
	end

	# to click on save button
	def CON.click_save_button
		if(IS_LIGHTNING_ENABLE)
			find(:xpath, "//button[@title='Save']//span").click
		else
			UTIL.re_execute_script_block do
			find(:xpath, $con_save_button).click
			end
		end
		UTIL.min_wait
	end


	# to compare two dates
	# @returns true if both are same, else false
	def CON.compare_last_send_swag_date_with_today current_date, last_send_swag_date
		current_date.eql? last_send_swag_date
	end


	# to click on "other address" button, which appears just after clicking on "send marketing material" button available on contact page
	def CON.click_on_other_address_button
		if(IS_LIGHTNING_ENABLE)
			CON.click_on_other_address_button_on_lightning
		else
			CON.click_on_other_address_button_on_classic
		end
	end


	def CON.click_on_other_address_button_on_lightning
		within_frame(find(:xpath, $con_lightning_frame)) do
			CON.click_on_other_address_button_on_classic
		end
	end


	def CON.click_on_other_address_button_on_classic
		find(:xpath,$con_send_swag_other_address).click
	end


	# to change the last send swag date, this field appears on contact detail page
	# @param date = this is the value of data you want to put in text field "last send swag date"
	def CON.change_swag_last_sent_date date
		if(IS_LIGHTNING_ENABLE)
			CON.change_swag_last_sent_date_on_lightning date
		else
			CON.change_swag_last_sent_date_on_classic date
		end
	end


	def CON.change_swag_last_sent_date_on_classic date
		find(:xpath,$con_swag_last_sent_date).double_click
		find(:xpath,$con_swag_last_sent_date_text_box).set date
		UTIL.min_wait
		SFL.click_button $sfl_save_button
	end


	def CON.change_swag_last_sent_date_on_lightning date
		find(:xpath, $con_detail_button_lightning,visible:true).click
		puts "clicked on con_detail_button_lightning"
		UTIL.min_wait
		#UTIL.scroll_to $con_swag_last_sent_date_lightng
		find(:xpath, $con_swag_last_sent_date_lightng,visible:true).click
		UTIL.min_wait
		find(:xpath, $con_swag_last_sent_date_text_box_lightening).set date
		find(:xpath, $sflt_save_button).click
	end


	# to get today's date
	def CON.get_todays_date
		today_date1 = Time.now.strftime("%m/%d/%Y")
		today_date = Date.strptime(today_date1, '%m/%d/%Y')
		puts "Today's date is #{today_date}"
		return today_date
	end


	# to get the value from "last sent swag" field, Available on contact detail page
	def CON.get_swag_last_sent_date
		if(IS_LIGHTNING_ENABLE)
			CON.get_swag_last_sent_date_on_lightning
		else
			CON.get_swag_last_sent_date_on_classic
		end
	end


	def CON.get_swag_last_sent_date_on_classic
		find(:xpath, $con_swag_last_sent_date).double_click
		last_sent_swag_date1 = find(:xpath,$con_swag_last_sent_date_text_box).value
		last_sent_swag_date = Date.strptime(last_sent_swag_date1, '%m/%d/%Y')
		puts "swag last sent date is #{last_sent_swag_date}"
		return last_sent_swag_date
	end


	def CON.get_swag_last_sent_date_on_lightning
		page.go_back
		find(:xpath, $con_detail_button_lightning).click
		UTIL.min_wait
		last_sent_swag_date_value = find(:xpath,$con_swag_last_sent_date_read_text_box_lightening).text
		logger.info "value of text is #{last_sent_swag_date_value}"
		last_sent_swag_date = Date.strptime(last_sent_swag_date_value, '%m/%d/%Y')
		logger.info "swag last sent date is #{last_sent_swag_date}"
		return last_sent_swag_date
	end


	# unused method
	def CON.filling_address_fields field_name_path, field_value
		find(:xpath,"(//input[@id='#{field_name_path}'])[1]").set field_value
		UTIL.min_wait
	end


	# unused method
	def CON.click_on_first_item_on_gift_store
		within_frame(find(:xpath, $con_canvas_outerframe)) do
			within_frame(find(:xpath, $con_canvas_innerframe)) do
				find(:xpath,$con_first_item_to_select_send_swag).click
				UTIL.max_wait
			end
		end
	end


	# to get the order name, which is basically a combination of program name + contact full name
	def CON.get_order_name program_name, con_full_name
		order_name = "Swag Order" +" - "+ con_full_name +" - "+ program_name
		logger.info "order name is #{order_name}"
		UTIL.min_wait
		return order_name
	end


	# unused method
	def CON.select_PFL_auto_contact_view
		find(:xpath, $con_all_contact_drop_down).click
		UTIL.min_wait
		find(:xpath, $con_PFL_auto_contact_option_value).click
		UTIL.min_wait
	end


	# to click on edit button for an order available on contact detail page, under swag iq order related list
	def CON.click_swag_iq_order_edit_button_under_related_list product_value, program_name, order_status
		program_title = program_name + " - " + product_value
		if(IS_LIGHTNING_ENABLE)
			find(:xpath, $con_lightng_swag_iq_order_view_all).click
			UTIL.page_load_waiting
			if (page.has_xpath?("(//*[contains(text(), '"+order_status+"')]/ancestor::tr[1]//a[contains(text(), '"+program_title+"')]/ancestor::tr[1]//span[contains(text(), 'Show More')]/..)[1]"))
				find(:xpath, "(//*[contains(text(), '"+order_status+"')]/ancestor::tr[1]//a[contains(text(), '"+program_title+"')]/ancestor::tr[1]//span[contains(text(), 'Show More')]/..)[1]").click
				UTIL.min_wait
				find(:xpath, "//div[@role='menu']/ul/li/a[@title='Edit']").click
				logger.info "clicked on edit button successfully" 
			end
    	else
	        UTIL.re_execute_script_block do
				within(find(:xpath, $con_swag_iq_order_related_list_section)) do
					find(:xpath, "//td[contains(text(), '"+order_status+"')]/ancestor::tr[1]//a[contains(text(), '"+program_title+"')]/ancestor::tr[1]//a[contains(text(), 'Edit')]").click
				end
        	end
    	end
	end


	# to change the order status upon order detail page
	def CON.set_contact_status_picklist_value_under_tracking_information_relatedlist con_order_status
		if(IS_LIGHTNING_ENABLE)
			find(:xpath, "//span[contains(text(),'Status')]/../following-sibling::div//a").click
			UTIL.page_load_waiting
			find(:xpath, "//a[contains(text(), '"+con_order_status+"')]").click
			UTIL.page_load_waiting
		else
			UTIL.re_execute_script_block do
				find(:xpath, $con_status_picklist_under_tracking_information_relatedlist).click
				UTIL.page_load_waiting
				find(:xpath, "//h3[contains(text(),'Tracking Information')]/../following-sibling::div[1]//tr[3]//td[2]//select//option[contains(text(), '"+con_order_status+"')]").click
				UTIL.page_load_waiting
			end
		end
			UTIL.min_wait
	end

	# to fill the address, when you click on "other address" button, comes just after clicking on "send marketing material" button on contact detail page
	# @param input_id = id of the input field, you want to enter the text
	# @param input_value = input value/text which you want to put in text box
	def CON.fill_other_address input_id, input_value
		if(IS_LIGHTNING_ENABLE)
			CON.fill_other_address_on_lightning input_id, input_value
		else
			CON.fill_other_address_on_classic input_id, input_value
		end
	end

	def CON.fill_other_address_on_lightning input_id, input_value
		within_frame(find(:xpath, $con_lightning_frame)) do
			CON.fill_other_address_on_classic input_id, input_value
		end
	end

	def CON.fill_other_address_on_classic input_id, input_value
		find(:xpath,"(//input[@id='"+input_id+"'])[1]").set input_value
		UTIL.min_wait
	end

	# to click on any element on salesforce page(excluding iframe pages)
	# @param element_xpath = xpath of the element, you want to click on salesforce page
	def CON.click_on_element element_xpath
		if(IS_LIGHTNING_ENABLE)
		within_frame(find(:xpath, $admin_lightning_frame)) do
			UTIL.re_execute_script_block do
				find(:xpath, element_xpath).click
			end
			UTIL.min_wait
		end
		else
			UTIL.re_execute_script_block do
				find(:xpath, element_xpath).click
			end
			UTIL.min_wait
		end
	end

	# to click on "use this address" button, which appears after filling the custom address(through "other address" button)
	def CON.click_custom_use_this_address
		if(IS_LIGHTNING_ENABLE)
			CON.click_custom_use_this_address_on_lightning
		else
			CON.click_custom_use_this_address_on_classic
		end
	end

	def CON.click_custom_use_this_address_on_lightning
		within_frame(find(:xpath, $con_lightning_frame)) do
			CON.click_custom_use_this_address_on_classic
		end
	end

	def CON.click_custom_use_this_address_on_classic
		find(:xpath,$con_custom_use_this_address).click
		UTIL.min_wait
	end

	# to click on back button, which appears after clicking on send swag button and "do not swag" option is checked for this user
	def CON.click_send_swag_back_pop_up
		if(IS_LIGHTNING_ENABLE)
			CON.click_send_swag_back_pop_up_on_lightning
		else
			CON.click_send_swag_back_pop_up_on_classic
		end
	end

	# to click on back button, which appears after clicking on send swag button and "do not swag" option is checked for this user
	def CON.click_send_swag_back_pop_up_on_classic
		find(:xpath,$con_do_not_swag_back_button).click
	end

	def CON.click_send_swag_back_pop_up_on_lightning
		within_frame(find(:xpath, $con_lightning_frame)) do
			CON.click_send_swag_back_pop_up_on_classic
		end
	end
end
