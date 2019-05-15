# Including all Page Services
require './lib/PageService/ContactService.rb'
#require './lib/PageService/SwagIqOrderService.rb'
require './lib/PageService/administrationService.rb'

# All local variabels
program_name1 = "Role_based_program"
program_name = UTIL.get_random_number program_name1
product_qty = '2'
product_c1 =1

describe "Verify Successfully program created with assignment type role with single product associated with it and user able to send swag.", smoke:true, sendswag:true, :type => :request do
	validation_found_msg = "Required Element found on Page"
	before :all do
		logger.info 'Before Block - TC06 Verify Successfully program created with assignment type role with single product associated with it and user able to send swag.'
		SFL.login SFUSER, SFPASS
		SFL.open_tab $con_tab_swag_IQ_tools
		ADMIN.click_program_admin_tile
		ADMIN.click_new_program_button
		ADMIN.set_program_name program_name
		ADMIN.click_on_program_ok_button
		ADMIN.click_on_add_program_product_button
		ADMIN.add_program_product product_c1, $admin_bd_auto_product_1
		ADMIN.set_budget_quantity_field product_c1, product_qty
		ADMIN.click_on_budget_allocation_label
		ADMIN.set_program_assignment_type product_c1, $admin_user_role
		ADMIN.add_program_role_name $admin_pfl_bd_auto_user_role
		ADMIN.click_on_add_role_button
		ADMIN.activate_program
		ADMIN.click_on_ok_user_confirmation

		prgram_status = ADMIN.verify_program_activated_inactivated $admin_program_activated_status
		expect(prgram_status).to eql(true)
		logger.info "Verify program is activated : #{prgram_status}"

		SFL.logout
		logger.info 'Completed Before Block of TC:06..... '
	end

	it "TS-1: Verify that user is able to send swag with associated product to Role Program" do
		logger.info 'Started TS-01: Verify that user is able to send swag with associated product to Role Program '
		SFL.login SFSUSER, SFSPASS
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl

		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
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
		SFL.logout
		logger.info 'Completed TS-01: Verify that user is able to send swag with associated product to Role Program '
		logger.info 'Completed Test case 06 . '
	end
	
	after :all do
		logger.info 'Entering into After All Block TC:06 --'
		SFL.login SFUSER, SFPASS
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl
		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.delete_swag_iq_order_status_under_related_list $admin_bd_auto_product_1, program_name, $con_order_status_submitted
		logger.info 'Test Case Completed TC:06 --'
	end
end
