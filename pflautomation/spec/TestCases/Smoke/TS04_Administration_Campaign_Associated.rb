# Including all Page Services
require './lib/PageService/ContactService.rb'
require './lib/PageService/administrationService.rb'

# All local variabels
program_name1 = "Admin_campaign_association"
program_name = UTIL.get_random_number program_name1
product_qty = '2'
product_c1 = 1
validation_found_msg = "Required Element found on Page"


describe "Verify that contact is associated to Campaign Under Program Administration", sendswag:true, smoke:true,  :type => :request do
	before :all do
		logger.info 'Before Block - TS04 running Contact is associated with Campaign after Sending Swag related to Program '
		SFL.login SFSUSER, SFSPASS
		SFL.open_tab $con_tab_swag_IQ_tools
		ADMIN.click_program_admin_tile
		ADMIN.click_new_program_button
		ADMIN.set_program_name program_name
		ADMIN.click_on_program_ok_button
		ADMIN.click_on_add_program_product_button
		ADMIN.add_program_product product_c1, $admin_bd_auto_product_1
		ADMIN.set_budget_quantity_field product_c1, product_qty
		ADMIN.set_program_campaign_value product_c1, $admin_bd_campaign_name
		ADMIN.set_program_campaign_member_status_field product_c1, $admin_campaign_status_sent
		ADMIN.click_on_add_users_button product_c1
		ADMIN.select_user_to_add_in_program $admin_pfl_bd_auto_user_first_name
		ADMIN.click_on_add_users_button_on_users_page
		ADMIN.click_on_ok_user_confirmation
		ADMIN.activate_program
		ADMIN.click_on_ok_user_confirmation
		prgram_status = ADMIN.verify_program_activated_inactivated $admin_program_activated_status
		expect(prgram_status).to eql(true)
		logger.info "Verify program is activated : #{prgram_status}"	
		SFL.logout
		logger.info 'Completed Before Block of TS:04..... '
	end

	it "TS-01: Verify that Contact is associated with Campaign after Sending Swag related to Program" do
		logger.info 'Started TS-01: Verify that Contact is associated with Campaign after Sending Swag related to Program '
		SFL.login SFSUSER, SFSPASS
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl
		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		UTIL.page_load_waiting
		CON.click_on_send_marketing_button
		CON.select_contact_Address
		CON.click_use_this_address_buttons

		assert_program = CON.verify_program_on_contact_send_marketing_page program_name
		expect(assert_program).to eql(true)
		logger.info "Verify program on contact send marketing page : #{assert_program}"
		
		CON.click_program_on_contact_send_marketing_page program_name, $admin_bd_auto_product_1
		CON.click_send_marketing_next_button
		CON.click_send_marketing_confirmation_msg
		CON.click_send_marketing_materials_button

		confirmation_msg = CON.verify_send_swag_confirmation_msg
        expect(confirmation_msg).to eql(true)
        logger.info "Verify send swag confirmation message : #{confirmation_msg}"

		CON.click_canvas_ok
		UTIL.max_wait

		status = CON.verify_associated_campaign_status_under_related_list_section $admin_bd_campaign_name
        expect(status).to eql(true)
        logger.info "Verify associated campaign status under related list section on contact : #{status}"  
		SFL.logout
		logger.info 'Completed Test case 04 . '
	end

  after :all do
  		logger.info 'Entering into After All Block TS:04 --'
		SFL.login SFUSER, SFPASS
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view "PFL Auto Contact"
		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.delete_swag_iq_order_status_under_related_list $admin_bd_auto_product_1, program_name, $con_order_status_submitted
		SFL.logout
		logger.info 'Test Case Completed TS:04 --'
  end
end
