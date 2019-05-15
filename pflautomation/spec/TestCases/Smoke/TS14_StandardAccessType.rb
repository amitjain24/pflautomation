#-------------------------------------------------------------------#
# 	Pre-Requisit: Ensure required Data Created
#  	Product Area: Administration
# 	Story: Testing Automation
#------------------------------------------
# Including all Page Services
require './lib/PageService/ContactService.rb'
require './lib/PageService/administrationService.rb'

user_name = 'amit.jain1@metacube.com'

describe "Verify that User with access level standard user could not access the Administrator tab and see the error message - You are not authorized to view that resource ", UI:true, smoke:true, :type => :request do
	validation_found_msg = "Required Element found on Page"
	#include_context "Login_Before_All"

	before :all do
		logger.info 'Before Block - TC014 running Verify that User with access level standard user could not access the Administrator tab and see the error message - You are not authorized to view that resource '
		SFL.login SFUSER , SFPASS
		SFL.open_tab $con_tab_swag_IQ_tools
		ADMIN.click_on_user_tile
		ADMIN.search_user_on_user_administration user_name
		ADMIN.open_user_detail_section
		ADMIN.change_user_access_to_standard
		ADMIN.save_user_on_Store
		UTIL.min_wait
		SFL.logout
		logger.info 'Completed Before Block of TC:14..... '
	end

	it "TS-01: Verify that access level standard user can't access the Administrator Tab and see the message -You are not authorized to view that resource" do
		logger.info "Started TS-01: Verify that access level standard user can't access the Administrator Tab and see the message -You are not authorized to view that resource "
		SFL.login SFAUSER, SFAPASS
		SFL.open_tab $con_tab_swag_IQ_tools
		assert_access = ADMIN.verify_standard_user_access_for_administration_tab
		expect(assert_access).to eql(true)
		logger.info "Verifying access level standard user for_administration_tab msg :#{assert_access}."
		SFL.logout
		logger.info 'Completed Test case 14 . '
	end

	after :all do
		logger.info 'Entering into After All Block TS:14 --'
  		SFL.login SFUSER, SFPASS
		SFL.open_tab $con_tab_swag_IQ_tools
  		ADMIN.click_on_user_tile
     	ADMIN.search_user_on_user_administration user_name
  		ADMIN.open_user_detail_section
  		ADMIN.change_user_access_to_admin
		ADMIN.save_user_on_Store
		UTIL.min_wait
		SFL.logout
		logger.info 'Test Case Completed TS:14 --'
	end
end
