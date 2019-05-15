# Including all Page Services
require './lib/PageService/ContactService.rb'
require './lib/PageService/SwagIqOrderService.rb'
require './lib/PageService/administrationService.rb'
## Including all Page Services

describe "Verifying available Tile Labels (User administration, Product Administration, Program Administration) and their content under Administration tab For Admin access level user", UI:true, smoke:true, :type => :request do
	validation_found_msg = "Required Element found on Page"
	#include_context "Login_Before_All"
	before :all do
		# nothing to do
	end
	it "TS-1: Verify presence of different administration tiles" do
		
    	logger.info 'Executing TS-1.....'
    	SFL.login SFUSER , SFPASS
    	SFL.open_tab $con_tab_swag_IQ_tools

  #   	assert_value = ADMIN.assert_element_on_administration_page $admin_program_admin_tile
	 # 	expect(false).to eql(true)
		# logger.info "Program Administration Tile appears on page : #{assert_value}"
		

		assert_value = ADMIN.assert_element_on_administration_page $admin_program_admin_tile
		expect(assert_value).to eql(true)
		logger.info "Program Administration Tile appears on page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_under_administration_page_tile $admin_program_admin_tile, $admin_program_admin_tile_li_view_program
		expect(assert_value).to eql(true)
		logger.info "List item View Program under Program Administration Tile appears on page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_under_administration_page_tile $admin_program_admin_tile, $admin_program_admin_tile_li_create_edit_programs
		expect(assert_value).to eql(true)
		logger.info "List items Create and Edit programs under Program Administration Tile appears on page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_on_administration_page $admin_user_admin_tile
		expect(assert_value).to eql(true)
		logger.info "User Administration Tile appears on page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_under_administration_page_tile $admin_user_admin_tile, $admin_user_admin_tile_li_add_edit_users
		expect(assert_value).to eql(true)
		logger.info "Add and Edit Users options appear under Administration Tile : #{assert_value}"
		
		assert_value = ADMIN.assert_element_under_administration_page_tile $admin_user_admin_tile, $admin_user_admin_tile_li_activate_inactivate_users
		expect(assert_value).to eql(true)
		logger.info "Active and Inactiver User options appear under User Administration Tile : #{assert_value}"
		
		assert_value = ADMIN.assert_element_on_administration_page $admin_product_admin_tile
		expect(assert_value).to eql(true)
		logger.info "Product Administration Tile appears on page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_under_administration_page_tile $admin_product_admin_tile, $admin_product_admin_tile_li_view_product
		expect(assert_value).to eql(true)
		logger.info "View products List item appears under Product Administration Tile : #{assert_value}"
		
		assert_value = ADMIN.assert_element_under_administration_page_tile $admin_product_admin_tile, $admin_product_admin_tile_li_edit_product_budget
		expect(assert_value).to eql(true)
		logger.info "Edit product budget List item appears under Product Administration Tile : #{assert_value}"
		
		assert_value = ADMIN.assert_element_under_administration_page_tile $admin_product_admin_tile, $admin_product_admin_tile_li_activate_inactivate_product
		expect(assert_value).to eql(true)
		logger.info "Active and Inactive products List item appear under Product Administration Tile : #{assert_value}"
		
	 	SFL.logout
   	logger.info 'Completed TS-1.....'
    end

	it "TS-2: Verify  presence of different components on Program administration  page" do
		logger.info 'Executing TS-2 - Verify  presence of different components on Program administration.'
		SFL.login SFUSER , SFPASS
		
		SFL.open_tab $con_tab_swag_IQ_tools

		ADMIN.click_program_admin_tile
		assert_value = ADMIN.assert_element_on_administration_page $admin_program_name_column
		expect(assert_value).to eql(true)
		logger.info "Name column appears on Program Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_on_administration_page $admin_program_product_column
		expect(assert_value).to eql(true)
		logger.info "Product column appears on Program Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_on_administration_page $admin_program_campaign_name_column
		expect(assert_value).to eql(true)
		logger.info "Campaign Name column appears on Program Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_on_administration_page $admin_program_budget_column
		expect(assert_value).to eql(true)
		logger.info "Budget column appears on Program Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_on_administration_page $admin_program_created_column
		expect(assert_value).to eql(true)
		logger.info "Created column appears on Program Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_on_administration_page  $admin_program_updated_column
		expect(assert_value).to eql(true)
		logger.info "Updated column appears on Program Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_on_administration_page $admin_program_active_column
		expect(assert_value).to eql(true)
		logger.info "Active column appears on Program Administration detail page : #{assert_value}"
		
		ADMIN.assert_element_on_administration_page $admin_new_program_button
		expect(assert_value).to eql(true)
		logger.info "New Program button appears on Program Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_on_administration_page $admin_program_search_bar_text
		expect(assert_value).to eql(true)
		logger.info "Search bar with Search program placeholder appears on Program Administration detail page : #{assert_value}"
		
		SFL.logout
		logger.info 'COMPLETED  TS-2 - .
		...'
	end

	it "TS-3: Verify  presence of different components on User administration page" do
		logger.info 'Executing TS-3 - Verify  presence of different components on User administration page'
		SFL.login SFUSER , SFPASS
		SFL.open_tab $con_tab_swag_IQ_tools
		
		ADMIN.click_on_user_tile

		assert_value = ADMIN.assert_element_using_label_on_administration_page $admin_user_first_name
		expect(assert_value).to eql(true)
		logger.info "First Name column appears on User Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_using_label_on_administration_page $admin_user_Last_name
		expect(assert_value).to eql(true)
		logger.info "last Name column appears on User Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_using_label_on_administration_page $admin_user_title
		expect(assert_value).to eql(true)
		logger.info "Title column appears on User Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_using_label_on_administration_page $admin_user_email
		expect(assert_value).to eql(true)
		logger.info "Email column appears on User Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_using_label_on_administration_page $admin_user_role
		expect(assert_value).to eql(true)
		logger.info "Role column appears on User Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_using_label_on_administration_page $admin_user_profile
		expect(assert_value).to eql(true)
		logger.info "Profile column appears on User Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_using_label_on_administration_page $admin_user_cost_center
		expect(assert_value).to eql(true)
		logger.info "Cost Center column appears on User Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_using_label_on_administration_page $admin_user_country
		expect(assert_value).to eql(true)
		logger.info "County column appears on User Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_using_label_on_administration_page $admin_user_type
		expect(assert_value).to eql(true)
		logger.info "User Type column appears on User Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_on_administration_page $admin_user_search_bar
		expect(assert_value).to eql(true)
		logger.info "Search bar with search users placeholder appears on User Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_on_administration_page $admin_add_Users_button
		expect(assert_value).to eql(true)
		logger.info "Add Users button appears on User Administration detail page : #{assert_value}"
		
		SFL.logout
		logger.info 'COMPLETED  TS-3 - ....'
	end

	it "TS-4: Verify  presence of different components on Product administration  page" do
		logger.info 'Executing TS-4 - Verify  presence of different components on Product administration  page'
		SFL.login SFUSER, SFPASS
		SFL.open_tab $con_tab_swag_IQ_tools
		ADMIN.click_on_product_tile

		assert_value = ADMIN.assert_element_using_label_on_administration_page $admin_product_budgeted
		expect(assert_value).to eql(true)
		logger.info "Budgeted column appears on Product Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_using_label_on_administration_page $admin_product_allocated
		expect(assert_value).to eql(true)
		logger.info "Allocated column appears on Product Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_using_label_on_administration_page $admin_product_active
		expect(assert_value).to eql(true)
		logger.info "Active column appears on Product Administration detail page : #{assert_value}"
		
		assert_value = ADMIN.assert_element_on_administration_page $admin_product_search_bar
		expect(assert_value).to eql(true)
		logger.info "Search bar with search products placeholder on Product Administration detail page : #{assert_value}"
		
		SFL.logout
		logger.info 'COMPLETED  TS-4 - ....'
	end

	after :all do
 		 # nothing to do
	end
end
