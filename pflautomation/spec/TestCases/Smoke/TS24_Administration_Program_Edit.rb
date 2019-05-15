# Including all Page Services
require './lib/PageService/ContactService.rb'
require './lib/PageService/administrationService.rb'

# All local variables
product_qty = '2'
product_c1 =1
product_c2 =2
product_qty_updated = 5
user_budget = 10
program_name1 = "prg_edit_auto_program"
random_count = Random.new.rand(1..3000)
program_name = program_name1 + random_count.to_s

describe "Verifying user is able to edit program after creation", smoke:true, :type => :request do
	validation_found_msg = "Required Element found on Page"
	before :all do
		logger.info 'Started TC 24 : Verifying user is able to Create program  '
		SFL.login SFRUSER, SFRPASS
		SFL.open_tab $con_tab_swag_IQ_tools

		ADMIN.click_program_admin_tile
		ADMIN.click_new_program_button
		ADMIN.set_program_name program_name
		ADMIN.click_on_program_ok_button
		ADMIN.click_on_add_program_product_button
		ADMIN.add_program_product product_c1, $admin_bd_auto_product_1
		ADMIN.set_budget_quantity_field product_c1, product_qty

		#asserting assignment type as User and budget allocation  as Distributed
		program_status = ADMIN.verify_content_on_page $admin_program_assignment_type_user
		expect(program_status).to eql(true)
		logger.info "Verifying Content on page for admin_program_assignment_type_user  :#{program_status}."

		program_status = ADMIN.verify_content_on_page $admin_program_budget_distributed
		expect(program_status).to eql(true)
		logger.info "Verifying Content on page for budget distributed  :#{program_status}."

		ADMIN.click_on_add_users_button product_c1
		ADMIN.select_user_to_add_in_program $standard_user_first_name2
		ADMIN.click_on_add_users_button_on_users_page
		ADMIN.click_on_add_user_confirmation_on_program
		ADMIN.activate_program
		ADMIN.click_on_ok_user_confirmation

		program_status = ADMIN.verify_program_activated_inactivated $admin_program_activated_status
		expect(program_status).to eql(true)
		logger.info "Verifying activated status of Program :#{program_status}."

		SFL.logout
		logger.info 'Befote Block completed  TC 24 : Verifying user is able to Create program  '
	end

	it "TS-1: Verify that user is able to disable and edit the above created program" do
		logger.info "Started TC 24 : Verify that user is able to disable and edit the above created program"
		SFL.login SFRUSER, SFRPASS
		SFL.open_tab $con_tab_swag_IQ_tools

		ADMIN.click_program_admin_tile
		ADMIN.verify_program_on_admin_page program_name
		ADMIN.click_on_program_from_search_result program_name
		ADMIN.inactivate_program
		ADMIN.click_on_ok_user_confirmation
		ADMIN.set_budget_quantity_field product_c1, product_qty_updated
		ADMIN.set_user_budget product_qty_updated
		ADMIN.click_on_element $admin_program_label_campaign_lookup
		ADMIN.set_program_campaign_value product_c1, $admin_bd_campaign_name
		ADMIN.set_program_campaign_member_status_field product_c1, $admin_bd_campaign_status_sent
		ADMIN.click_on_element $admin_program_label_campaign_lookup
		ADMIN.activate_program
		ADMIN.click_on_ok_user_confirmation

		program_status = ADMIN.verify_program_activated_inactivated $admin_program_activated_status
		expect(program_status).to eql(true)
		logger.info "Verifying activated status of Program :#{program_status}."

		SFL.logout
		logger.info "TC:24 Completed ..."
	end

	after :all do
    # Nothing to do
	end
end
