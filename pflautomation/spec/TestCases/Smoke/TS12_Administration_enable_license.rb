#-------------------------------------------------------------------#
# 	Pre-Requisit: Ensure required Data Created
#  	Product Area: Licenses
# 	Story: Testing Automation
#------------------------------------------
# Including all Page Services
require './lib/PageService/ContactService.rb'
require './lib/PageService/LicensesService.rb'
require './lib/PageService/administrationService.rb'

# Including all Page Services
describe "Verify clicking select all  'enabled' checkbox on Licenses page functionality", UI:true, smoke:true, :type => :request do
	assertion_msg_licensed_user = "License assigned to all users"
	#include_context "Login_Before_All"
	before :all do
		# Nothing to do
	end

	it "TS:1 Verifying the select all Enabled checkbox , assign license to all users on page and License Count increased by number with selected count" do
		logger.info 'Executing TC-12.FOR Verifying the select all Enabled checkbox , assign license to all users on page and License Count increased by number with selected count'
		SFL.login SFUSER , SFPASS
		SFL.open_tab $con_tab_swag_IQ_tools
		LIC.click_licenses_tab

		#After Disabling all user license
		LIC.disable_license_to_all_user

		#After enabling all user license
		LIC.enable_license_to_all_user

		total_user = LIC.get_total_number_user_on_license_page
		lic_user = LIC.get_total_number_displaying_licensed_user

		expect(total_user).to eql(lic_user)
		logger.info "License assigned to all users : #{total_user}"
		SFL.logout
		logger.info 'Completed TS-12.....'
	end

	after :all do
		# Nothing to do
	end
end
