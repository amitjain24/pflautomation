# Including all Page Services
require './lib/PageService/ContactService.rb'
require './lib/PageService/administrationService.rb'

# All local variables
product_qty = '2'
product_c1 =1
program_name1 = 'Enable-disable_auto_program'
program_name = UTIL.get_random_number program_name1

describe "Verifying the enable/disable state of program and its impact on send Swag",smoke:true, sendswag:true,  :type => :request do
	validation_found_msg = "Required Element found on Page"
	##include_context "Login_Before_All"
	before :all do
		logger.info 'Before Block  TC-21.FOR Verifying the enable/disable state of program and its impact on send Swag'
		SFL.login SFUSER, SFPASS
		SFL.open_tab $con_tab_swag_IQ_tools
        ADMIN.click_program_admin_tile
		ADMIN.click_new_program_button
		ADMIN.set_program_name program_name
		ADMIN.click_on_program_ok_button
		ADMIN.click_on_add_program_product_button
		ADMIN.add_program_product product_c1, $admin_bd_auto_product_1
		ADMIN.set_budget_quantity_field product_c1, product_qty
		ADMIN.click_on_add_users_button product_c1
		ADMIN.select_user_to_add_in_program $standard_user_first_name2
		ADMIN.click_on_add_users_button_on_users_page
		ADMIN.click_on_add_user_confirmation_on_program
		ADMIN.activate_program
		ADMIN.click_on_ok_user_confirmation

		program_status = ADMIN.verify_program_activated_inactivated $admin_program_activated_status
		expect(program_status).to eql(true)
		logger.info "Verify active program state  : #{program_status} "

		SFL.logout
		logger.info 'Before Block completed for TC:21' 
	end

	it "TS-01: Verifying the activation of program by sending swag" do
		logger.info 'Started TC 21 : Verifying the activation of program by sending swag'
	 	SFL.login SFRUSER, SFRPASS
		SFL.open_tab $con_tab_contacts
        SFL.select_list_view $con_view_pfl

        CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.click_on_send_marketing_button
		CON.select_contact_Address
		CON.click_use_this_address_buttons
        CON.click_program_on_contact_send_marketing_page program_name,$admin_bd_auto_product_1
		CON.click_send_marketing_next_button
		CON.click_send_marketing_confirmation_msg
		CON.click_send_marketing_materials_button

		confirmation_msg = CON.verify_send_swag_confirmation_msg
		expect(confirmation_msg).to eql(true)
		logger.info "Verify active program on contact Send Swag page  : #{confirmation_msg} "

        CON.click_canvas_ok
       	SFL.logout
       	logger.info 'Completed Test Step -1 for  TC:21'
    end
    
    it "TS-02: Verifying the deactivation of program by sending swag" do 
    	logger.info 'Started TC 21 : Verifying the deactivation of program by sending swag'  	
        SFL.login SFRUSER, SFRPASS
        SFL.open_tab $con_tab_swag_IQ_tools

        ADMIN.click_program_admin_tile
        ADMIN.verify_program_on_admin_page program_name
        ADMIN.click_on_program_from_search_result program_name
        ADMIN.inactivate_program
        ADMIN.click_on_ok_user_confirmation

        program_status = ADMIN.verify_program_activated_inactivated $admin_program_inactivated_status
        expect(program_status).to eql(true)
        logger.info "Verify inactive program : #{program_status} "


        SFL.open_tab $con_tab_contacts
        SFL.select_list_view $con_view_pfl
        CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
        CON.click_on_send_marketing_button
        CON.select_contact_Address
        CON.click_use_this_address_buttons

        assert_program = CON.verify_inactive_program_on_contact_send_marketing_page program_name
        expect(assert_program).to eql(true)
        logger.info "Verify inactive program on contact Send Swag page  : #{assert_program} "

        SFL.logout
        logger.info 'Completed Test Step -2 for  TC:21'
	end
	
	after :all do
		logger.info 'Entering into After All Block TS:21 --'
		SFL.login SFUSER, SFPASS
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl

		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.delete_swag_iq_order_status_under_related_list $admin_bd_auto_product_1, program_name, $con_order_status_submitted
		SFL.logout
		logger.info 'Test Case Completed TS:21 --'
	end
end
