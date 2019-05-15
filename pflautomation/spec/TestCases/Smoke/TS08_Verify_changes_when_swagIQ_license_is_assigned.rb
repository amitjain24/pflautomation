#-------------------------------------------------------------------#
# 	Pre-Requisit: Ensure required Data Created
#  	Product Area: Licenses
# 	Story: Testing Automation
#-------------------------------------------------------------------#
# Including all Page Services
require './lib/PageService/ContactService.rb'
require './lib/PageService/LicensesService.rb'
require './lib/PageService/administrationService.rb'


modifier_users_count = "1"

# Including all Page Services
describe "Verify clicking select all  'enabled' checkbox on Licenses page functionality", smoke:true,  :type => :request do
	assertion_msg_licensed_user = "License assigned to all users"
	before :all do
		# Nothing to do
	end

	it "TS:1 Verifying the select all Enabled checkbox, assign license to all users on page and License Count increased by number with selected count" do
		logger.info 'Started TC:08 Verify clicking select all enabled checkbox on Licenses page functionality'
		SFL.login SFUSER, SFPASS
		SFL.open_tab $con_tab_swag_IQ_tools
		LIC.click_licenses_tab

		license_count_before_assignment = LIC.get_licensed_users_value

		LIC.assign_license_to_user $bd_unlicensed_user_name
		LIC.verify_modified_users_label_and_count_exists modifier_users_count
		LIC.click_save_button
		LIC.verify_license_checkbox_checked $bd_unlicensed_user_name

		license_count_after_assignment = LIC.get_licensed_users_value

		LIC.get_license_count_difference license_count_after_assignment, license_count_before_assignment
		SFL.logout
		logger.info 'Completed TC-08 it block' 	
	end

  after :all do
		logger.info 'Entering into After All Block TC:08 --'
		SFL.login SFUSER, SFPASS
		SFL.open_tab $con_tab_swag_IQ_tools
		LIC.click_licenses_tab
		LIC.remove_license_to_user $bd_unlicensed_user_name
		LIC.click_save_button
		SFL.logout
		logger.info 'Test Case Completed TC:08 --'
  end
end
