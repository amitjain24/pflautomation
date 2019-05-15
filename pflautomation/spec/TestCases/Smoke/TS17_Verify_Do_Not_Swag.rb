#-------------------------------------------------------------------#
# 	Pre-Requisit: Ensure required Data Created
#  	Product Area: Send Swag
# 	Story: Testing Automation
#------------------------------------------
# Including all Page Services
require './lib/PageService/ContactService.rb'

describe "Verify that User will not be able to Send Swag IF ‘Do Not Swag' field is checked for Contact ", smoke:true, sendswag:true, :type => :request do
	validation_found_msg = "Required Element found on Page"

	include_context "Login_Before_All"
	before :all do

	end

	it "TS-01: Verify User is not able to Send Swag if Do Not Swag field is enabled for Contact " do
		logger.info 'Starting TC-17: Verify User is not able to Send Swag if Do Not Swag field is enabled for Contact'
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl
		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.set_do_not_swag_checkbox_as_checked

		CON.click_on_send_marketing_button

		assert_access = CON.verify_send_swag_not_available
		expect(assert_access).to eql(true)
		logger.info "Verify send swag not available : #{assert_access}"

		CON.click_send_swag_back_pop_up
		SFL.logout
		logger.info 'Completed TC-17 it block'
	end

	after :all do
		logger.info 'Entering into After All Block TC:17 --'
		SFL.login SFUSER, SFPASS
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view "PFL Auto Contact"
		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.set_do_not_swag_checkbox_as_unchecked
		SFL.logout
		logger.info 'Test Case Completed TC:17 --'
	end
end
