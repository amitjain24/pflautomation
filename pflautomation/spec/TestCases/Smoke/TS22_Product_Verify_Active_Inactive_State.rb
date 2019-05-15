# Including all Page Services
require './lib/PageService/ContactService.rb'
require './lib/PageService/administrationService.rb'

# All local variables
product_c1 =1

prg_1 = "Auto Program 4"
prg_2 = "Auto Program 5"
product_name = "PFL_Auto_Product4"
program_name = UTIL.get_random_number prg_1
program_name2 = UTIL.get_random_number prg_2

describe "Verifying Active/Inactive State of Product on Product Administration", smoke:true, :type => :request do
	validation_found_msg = "Required Element found on Page"
	before :all do
		# Nothing to do
	end

	it "TS-1: Verifying Active State of Product on Product Administration" do
		logger.info 'Started TC 22 : Verifying Active State of Product on Product Administration'
		SFL.login SFRUSER, SFRPASS
		SFL.open_tab $con_tab_swag_IQ_tools
		ADMIN.click_on_product_tile
		ADMIN.click_product_search_bar_on_product_administration product_name
		ADMIN.click_product_detail_section product_name
		ADMIN.click_activate_product

		SFL.open_tab $con_tab_swag_IQ_tools

		ADMIN.click_program_admin_tile
		ADMIN.click_new_program_button
		ADMIN.set_program_name program_name
		ADMIN.click_on_program_ok_button
		ADMIN.click_on_add_program_product_button
		ADMIN.add_program_product product_c1, product_name

		assert_product = ADMIN.verify_content_on_page $admin_program_page_product_xpath_after_selection
		expect(assert_product).to eql(true)
		logger.info "Verify xpath active selecting product in program : #{assert_product} "

		SFL.logout
		logger.info 'Completed Test Step -1 for TC:22'
	end

	it "TS-2: Verifying Inactive State of Product on Product Administration" do
		logger.info 'Started   Test Step -2 for TC 22 : Verifying Active State of Product on Product Administration'
		SFL.login SFRUSER, SFRPASS
		SFL.open_tab $con_tab_swag_IQ_tools
		ADMIN.click_on_product_tile
		ADMIN.click_product_search_bar_on_product_administration product_name
		ADMIN.click_product_detail_section product_name
		ADMIN.click_deactivate_product

		SFL.open_tab $con_tab_swag_IQ_tools

		ADMIN.click_program_admin_tile
		ADMIN.click_new_program_button
		ADMIN.set_program_name program_name2
		ADMIN.click_on_program_ok_button
		ADMIN.click_on_add_program_product_button
		ADMIN.add_program_product product_c1, product_name

		assert_product = ADMIN.verify_content_on_page $admin_program_page_product_unavailable_text
		expect(assert_product).to eql(true)
		logger.info "Verify error msg for unavailable product  : #{assert_product} "

		SFL.logout
		logger.info 'Completed Test Step -2 for  TC:22'
	end

	after :all do
		logger.info 'Entering into After All Block TS:22 --'
		SFL.login SFRUSER, SFRPASS
		SFL.open_tab $con_tab_swag_IQ_tools

		ADMIN.click_on_product_tile
		ADMIN.click_product_search_bar_on_product_administration product_name
		ADMIN.click_product_detail_section product_name
		ADMIN.click_activate_product

		SFL.logout
		logger.info 'Test Case Completed TS:22 --'
	end
end
