# Including all Page Services
require './lib/PageService/ContactService.rb'
require './lib/PageService/administrationService.rb'

describe "Send Swag - Verify that user is able to send the swag through Account address", Smoke:true,  :type => :request do
  validation_found_msg = "Contact Address element is found : "
  validation_found_msg1 = "Verify confirmation msg on send swag :"
  validation_found_msg2 = "Account Address element is found : "

sfad = "test-user@metacubeautomation.com"
sfpw = "admin123#"
first_name = "PFL"
last_name =  "Auto Contact4907"
prg_name = "PFL_Auto_Program_Deepak"

	before :all do
		#Nothing to do
	end

	it "TS-1: Verify SwagIQ Order Created on contact address." do
		SFL.login sfad, sfpw
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl
		CON.open_contact first_name, last_name
		CON.click_on_send_marketing_button

		assert_program = UTIL.verify_xpath_on_page $con_send_swag_select_address
		assert_values_and_report_result true, assert_program, validation_found_msg

		CON.select_contact_Address
		CON.click_use_this_address_buttons
		CON.click_program_on_contact_send_marketing_page prg_name, $admin_bd_auto_product_1
		CON.click_send_marketing_next_button
		CON.click_send_marketing_confirmation_msg
		CON.click_send_marketing_materials_button

		confirmation_msg = CON.verify_send_swag_confirmation_msg
		assert_values_and_report_result true, confirmation_msg, validation_found_msg1
		logger.info 'SwagIQ Order Created'
		CON.click_canvas_ok
		SFL.logout
		logger.info 'logged out successfully'
	end

	it "TS-2: Verify SwagIQ Order Created on Account address." do
		SFL.login sfad, sfpw
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view "PFL Auto Contact"
		CON.open_contact first_name, last_name
		CON.click_on_send_marketing_button

		assert_program = UTIL.verify_xpath_on_page $con_account_billing_send_swag_select_address
		assert_values_and_report_result true, assert_program, validation_found_msg2
		puts "verified xpath of account billing address block"

		CON.click_on_element $con_account_billing_send_swag_select_address
		CON.click_use_this_address_buttons
		CON.click_program_on_contact_send_marketing_page prg_name, $admin_bd_auto_product_1
		CON.click_send_marketing_next_button
		CON.click_send_marketing_confirmation_msg
		CON.click_send_marketing_materials_button

		confirmation_msg = CON.verify_send_swag_confirmation_msg
		assert_values_and_report_result true, confirmation_msg, validation_found_msg1

		CON.click_canvas_ok
		SFL.logout
	end

	after :all do
		SFL.login sfad, sfpw
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view "PFL Auto Contact"
		CON.open_contact first_name, last_name
		CON.delete_swag_iq_order_status_under_related_list $admin_bd_auto_product_1, prg_name, $con_order_status_submitted
		CON.delete_swag_iq_order_status_under_related_list $admin_bd_auto_product_1, prg_name, $con_order_status_submitted
		SFL.logout
	end
end
