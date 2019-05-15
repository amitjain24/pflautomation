# Including all Page Services
require './lib/PageService/ContactService.rb'
require './lib/PageService/administrationService.rb'

describe "Send Swag - Verify that user is able to send the swag through Account address", smoke:true, UI:true,  :type => :request do
  validation_found_msg = "Contact Address element is found : "
  validation_found_msg1 = "Verify confirmation msg on send swag :"
  validation_found_msg2 = "Account Address element is found : "

	before :all do
		#Nothing to do
	end

	it "TS-1: Verify SwagIQ Order Created on contact address." do
		logger.info 'logging in for TC03 verifying order on contact and account address'
		SFL.login SFSUSER, SFSPASS
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl
		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.click_on_send_marketing_button

		assert_program = UTIL.verify_xpath_on_page $con_send_swag_select_address
		expect(assert_program).to eql(true)
		logger.info "Contact address section appears on page during send swag : #{assert_program}"

		CON.select_contact_Address
		CON.click_use_this_address_buttons
		CON.click_program_on_contact_send_marketing_page $admin_bd_auto_program_1, $admin_bd_auto_product_1
		CON.click_send_marketing_next_button
		CON.click_send_marketing_confirmation_msg
		CON.click_send_marketing_materials_button

		confirmation_msg = CON.verify_send_swag_confirmation_msg
		expect(confirmation_msg).to eql(true)
		logger.info "Confirmation message appears on final step of send swag : #{assert_program}"

		logger.info 'SwagIQ Order Created'
		CON.click_canvas_ok
		SFL.logout
		logger.info 'created program and logging out for TC03 verifying order on contact and account address'
	end

	it "TS-2: Verify SwagIQ Order Created on Account address." do
		logger.info 'Verifying account address to send swag for TC03'
		SFL.login SFSUSER, SFSPASS
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl
		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.click_on_send_marketing_button

		assert_program = UTIL.verify_xpath_on_page $con_account_billing_send_swag_select_address
		expect(assert_program).to eql(true)
		logger.info "Account billing address section appears on page during send swag : #{assert_program}"

		CON.click_on_element $con_account_billing_send_swag_select_address
		CON.click_use_this_address_buttons
		CON.click_program_on_contact_send_marketing_page $admin_bd_auto_program_1, $admin_bd_auto_product_1
		CON.click_send_marketing_next_button
		CON.click_send_marketing_confirmation_msg
		CON.click_send_marketing_materials_button

		confirmation_msg = CON.verify_send_swag_confirmation_msg
		expect(confirmation_msg).to eql(true)
		logger.info "Confirmation message appears on final step of send swag : #{assert_program}"

		CON.click_canvas_ok
		SFL.logout
		logger.info 'logging out from it block of account address to send swag for TC03'
	end

	after :all do
		logger.info 'Entering in after all block of TC03 Verifying account address to send swag'
		SFL.login SFUSER, SFPASS
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl
		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.delete_swag_iq_order_status_under_related_list $admin_bd_auto_product_1, $admin_bd_auto_program_1 , $con_order_status_submitted
		CON.delete_swag_iq_order_status_under_related_list $admin_bd_auto_product_1, $admin_bd_auto_program_1 , $con_order_status_submitted
		SFL.logout
		logger.info 'logging out from after all block of TC03 Verifying account address to send swag'
	end
end
