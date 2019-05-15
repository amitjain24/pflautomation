# Including all Page Services
require './lib/PageService/ContactService.rb'
require './lib/PageService/administrationService.rb'

# All local variables
	

prg_1 = "Auto Program quantity assert"
product_name = "PFL_Auto_Product5"
product_c1 =1
program_name = UTIL.get_random_number prg_1

describe "Verify Product Configuration (Display Name or Quantity) Under Product Administration and Configured product displayed While creating a Program", UI:true, smoke:true, :type => :request do
	validation_found_msg = "Required Element found on Page"
	before :all do
    # Nothing to do
	end

	it "TS-1: Verify Product Configuration (Quantity) Under Product Administration and program page" do
		logger.info 'Executing TC-13.Verify Product Configuration (Quantity) Under Product Administration and program page '
		SFL.login SFUSER , SFPASS
		SFL.open_tab $con_tab_swag_IQ_tools
		ADMIN.click_on_product_tile
		ADMIN.click_product_search_bar_on_product_administration product_name
		ADMIN.click_product_detail_section product_name

		unallocated_product_qty = ADMIN.get_unallocated_qty

		ADMIN.click_activate_product
		SFL.open_tab $con_tab_swag_IQ_tools
		ADMIN.click_program_admin_tile
		ADMIN.click_new_program_button
		ADMIN.set_program_name program_name
		ADMIN.click_on_program_ok_button
		ADMIN.click_on_add_program_product_button
		ADMIN.add_program_product product_c1, product_name
		ADMIN.click_on_available_budget_refresh_button product_c1

		available_product_qty = ADMIN.get_product_quantity_on_program_page

		result = UTIL.compare_values unallocated_product_qty, available_product_qty
		expect(result).to eql(true)
		logger.info "Comaprision on unallocated product qty : #{result}"

		SFL.logout
		logger.info 'Completed TS-13.....'
	end

	after :all do
	end
end
