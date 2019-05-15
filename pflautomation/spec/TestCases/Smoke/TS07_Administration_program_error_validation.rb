# Including all Page Services
require './lib/PageService/ContactService.rb'
require './lib/PageService/administrationService.rb'

program_name1 = "Test-Automation program_validation"
program_name = UTIL.get_random_number program_name1
product_c1 = 1
budget_quantity_zero = 1

describe "Verifying error message when quantity is exceeding than the available", UI:true, smoke:true,  :type => :request do
	validation_found_msg = "Required Element found on Page"
	before :all do
		# Nothing to do
	end

	it "TS-01: Verifying error message when quantity is exceeding than the available" do
		logger.info 'Starting TC-07: Verifying error message when quantity is exceeding than the available'
		SFL.login SFUSER , SFPASS
		SFL.open_tab $con_tab_swag_IQ_tools
		ADMIN.click_program_admin_tile
		ADMIN.click_new_program_button
		ADMIN.set_program_name program_name
		ADMIN.click_on_program_ok_button
		ADMIN.click_on_add_program_product_button

		#enter the variables values
		ADMIN.add_program_product product_c1, $admin_bd_auto_product_3
		ADMIN.click_on_available_budget_refresh_button product_c1

		product_quantity = ADMIN.get_product_quantity
		ADMIN.set_budget_quantity_field product_c1, product_quantity

		ADMIN.click_on_available_budget_refresh_button product_c1
		ADMIN.click_on_add_users_button product_c1
		ADMIN.select_user_to_add_in_program $admin_pfl_bd_auto_user_first_name
		ADMIN.click_on_add_users_button_on_users_page
		ADMIN.click_on_ok_user_confirmation

		user_budget = ADMIN.get_user_budget
		ADMIN.set_user_budget user_budget

		ADMIN.activate_program
		ADMIN.click_on_ok_user_confirmation

		assert_validation_prg_msg  = ADMIN.assert_validation_for_exceed_program_user_budget $admin_product_budget_exceed_msg
		expect(assert_validation_prg_msg).to eql(true)
		logger.info "Verify program product budget is exceeded : #{assert_validation_prg_msg}"

		assert_validation_user_msg = ADMIN.assert_validation_for_exceed_program_user_budget $admin_user_budget_exceed_msg
		expect(assert_validation_user_msg).to eql(true)
		logger.info "Verify user budget is exceeded : #{assert_validation_user_msg}"

		ADMIN.set_budget_quantity_field product_c1, budget_quantity_zero
		ADMIN.click_on_available_budget_refresh_button product_c1

		#user_budget = ADMIN.get_user_budget
		ADMIN.set_user_budget budget_quantity_zero
		ADMIN.click_on_available_budget_refresh_button product_c1

		SFL.logout
		logger.info 'Completed TS-01: Verifying error message when quantity is exceeding than the available'
		logger.info 'Completed TC-07' 
	end

    after :all do
        #Nothing to do
    end
end
