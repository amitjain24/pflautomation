#-------------------------------------------------------------------#
# 	Pre-Requisit: Ensure required Data Created
#  	Product Area: Administration
# 	Story: Testing Automation
#------------------------------------------
# Including all Page Services
require './lib/PageService/ContactService.rb'
require './lib/PageService/administrationService.rb'


# All local variabels
product_qty = '1'
product_c1 =1
program_name1 = 'PFL_Auto_Program-User-Shared-4'
budget_allocation = 'Shared'
program_to_deactive = 'PFL_Auto_Program-User-Shared-4'
random_count = Random.new.rand(5000..10000)
program_name = program_name1 + random_count.to_s
#program_name = 'PFL_Auto_Program-User-Shared-46397'
order_status = 'Submitted'

describe "Verify Single user can consume all quantity using shared program based upon multiple users", smoke:true, sendswag:true, :type => :request do
	validation_found_msg = "Required Element found on Page"
	before :all do
		logger.info 'Before Block - TC09: Verify Single user can consume all quantity using shared program based upon multiple users'
		SFL.login SFUSER, SFPASS
    	SFL.open_tab $con_tab_swag_IQ_tools
    	ADMIN.click_program_admin_tile
		ADMIN.click_new_program_button
		ADMIN.set_program_name program_name
		ADMIN.click_on_program_ok_button
		ADMIN.click_on_add_program_product_button
		ADMIN.add_program_product product_c1, $admin_bd_auto_product_1
		ADMIN.set_budget_quantity_field product_c1, product_qty
		ADMIN.set_budget_allocation_field budget_allocation
		ADMIN.click_on_budget_allocation_label


    # asserting assignment type as User and budget allocation  as Shared
		program_status_assignment_type = ADMIN.verify_content_on_page $admin_program_assignment_type_user
		expect(program_status_assignment_type).to eql(true)
		logger.info "Assignment type selected is - User : #{program_status_assignment_type}"

		program_status_budget_allocation = ADMIN.verify_content_on_page $admin_program_budget_shared
		expect(program_status_budget_allocation).to eql(true)
		logger.info "budget allocation selected is - Shared : #{program_status_budget_allocation}"

		#adding First user
		ADMIN.click_on_add_users_button product_c1
		ADMIN.select_user_to_add_in_program $standard_user_first_name1
		ADMIN.click_on_add_users_button_on_users_page
		ADMIN.click_on_ok_user_confirmation

		#adding second user
    	UTIL.min_wait
		ADMIN.click_on_add_users_button product_c1
		ADMIN.select_user_to_add_in_program $admin_user_firsr_name
		ADMIN.click_on_add_users_button_on_users_page
		ADMIN.click_on_ok_user_confirmation

		ADMIN.activate_program
		ADMIN.click_on_ok_user_confirmation

		program_status = ADMIN.verify_program_activated_inactivated $admin_program_activated_status
		expect(program_status).to eql(true)
		logger.info "Program is activated : #{program_status}"

		ADMIN.click_on_program_header

		assert_program = ADMIN.verify_program_on_admin_page program_name
		expect(assert_program).to eql(true)
		logger.info "Verify that created program appears in program list : #{assert_program}"		

    	SFL.logout
    	logger.info 'Completed Before Block of TC:09..... '
	end

	it "TS:1 Verify valid user can create Shared type program successfully and user can consume all product quantity" do

		logger.info "Started TS-01: Verify valid user can create Shared type program successfully and user can consume all product quantity"
		SFL.login SFNUSER, SFNPASS
    	SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl
		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.click_on_send_marketing_button
		CON.select_contact_Address
		CON.click_use_this_address_buttons

		assert_program = CON.verify_program_on_contact_send_marketing_page program_name
		expect(assert_program).to eql(true)
		logger.info "Verify program availability on contact send marketing page : #{assert_program}"

		CON.click_program_on_contact_send_marketing_page program_name, $admin_bd_auto_product_1
    	CON.click_send_marketing_next_button
		CON.click_send_marketing_confirmation_msg
		CON.click_send_marketing_materials_button

    	confirmation_msg = CON.verify_send_swag_confirmation_msg
    	expect(confirmation_msg).to eql(true)
    	logger.info "Confirmation message appears on final step of send swag : #{confirmation_msg}"
		
		CON.click_canvas_ok
		UTIL.med_wait
		SFL.logout
		logger.info "Completed TS-01: Verify valid user can create Shared type program successfully and user can consume all product quantity"

	end 

	it "verifying from another user" do

		#Verify the SF user
		logger.info "Started TS-02: verifying from another user"
    	SFL.login SFUSER, SFPASS
    	SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl
		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.click_on_send_marketing_button
		CON.select_contact_Address
		CON.click_use_this_address_buttons

    	assert_program = CON.verify_program_on_contact_send_marketing_page program_name
		expect(assert_program).to eql(true)
		logger.info "Verify program on contact send marketing page : #{assert_program}"

   		 #Asserting the Quantity For Product Tile
    	assert_program_quantity = CON.verify_program_product_quantity program_name
    	expect(assert_program_quantity).to eql(true)
		logger.info "Verify program product quantity : #{assert_program_quantity}"    	
    	puts "order name is #{assert_program_quantity}"
    	SFL.logout
    	logger.info "Completed TS-02: verifying from another user"
  end

	# deactivating the program
	after :all do
		logger.info 'Entering into After All Block TC:09 --'
    	SFL.login SFUSER, SFPASS
    	SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl
		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.delete_swag_iq_order_status_under_related_list $admin_bd_auto_product_1, program_name, $con_order_status_submitted
		logger.info 'Test Case Completed TC:09 --'
	end
end
