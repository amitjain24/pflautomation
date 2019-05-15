#-------------------------------------------------------------------#
# 	Pre-Requisite: Ensure required Data Created
#  	Product Area: Administration
# 	Story: Testing Automation
#   Test_Case_26 - Verifying the Remove user from Store on User Administrator
#------------------------------------------
# Including all Page Services
require './lib/PageService/administrationService.rb'
require './lib/PageService/ContactService.rb'

# Including all Page Services


describe "Verifying the Removal of user from Store on User Administrator", UI:true, smoke:true, :type => :request do
	validation_found_msg = "Required Element found on Page"

	before :all do
		logger.info 'Before Block  TC-23.FOR Verifying the Removal of user from Store on User Administrator'
		SFL.login SFRUSER, SFRPASS
		SFL.open_tab $con_tab_swag_IQ_tools

		ADMIN.click_on_user_tile
		ADMIN.search_user_on_user_administration $admin_pfl_bd_amit_user
		ADMIN.open_user_detail_section
		ADMIN.remove_user_on_Store
		ADMIN.click_on_yes_user_confirmation

		SFL.logout
		logger.info 'Completed Before Block of TC:23 ..... '
	end

	it "TS-1: Verifying the remove user into the Store" do
		logger.info 'Started TS-01: Verifying the remove user into the Store '
		SFL.login SFAUSER,SFAPASS
		SFL.open_tab $con_tab_swag_IQ_tools
		assert_error_msg = ADMIN.verify_unauthorized_message_on_administrator_page
		expect(assert_error_msg).to eql(true)
		logger.info "Verifying access level standard user for_administration_tab msg :#{assert_error_msg}."
		SFL.logout
		logger.info 'Completed Test case 23 . '
	end

	after :all do
		logger.info 'Entering into After All Block TS:23 --'
		SFL.login SFRUSER, SFRPASS
		SFL.open_tab $con_tab_swag_IQ_tools

		ADMIN.click_on_user_tile
		ADMIN.click_on_add_users_button_on_users_administration_page
		ADMIN.search_user_on_user_administration $admin_pfl_bd_amit_user
		ADMIN.select_user_to_add_in_store
		ADMIN.click_add_user_button_in_store
		ADMIN.click_on_ok_user_confirmation

		SFL.logout
		logger.info 'Test Case Completed TS:23 --'
	end
end
