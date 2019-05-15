#-------------------------------------------------------------------#
# 	Pre-Requisit: Ensure required Data Created
#  	Product Area: Administration
# 	Story: Testing Automation
#------------------------------------------
# Including all Page Services
require './lib/PageService/ContactService.rb'
require './lib/PageService/administrationService.rb'

# All local variabels
validation_found_msg = "Required Base Program is visible to associated user PFL_Auto_Program1:"

describe "Verify Successfully created  active program associated with SwagIQ User displaying Under Send Marketing Material Page..", smoke:true, UI:true,  :type => :request do
	before :all do
	end

	it "TS-1: Verify base program is Visible Under Send Marketing Material for program associated user." do
	logger.info 'logging into for TS02_Administration_verify_program'
		SFL.login SFSUSER, SFSPASS
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view "PFL Auto Contact"
		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.click_on_send_marketing_button
		CON.select_contact_Address
		CON.click_use_this_address_buttons

		assert_program = CON.verify_program_on_contact_send_marketing_page $admin_bd_auto_program_1
		
		expect(true).to be(assert_program)
		logger.info "Program appears on send swag page : #{assert_program}"

		logger.info 'logged out for TS02_Administration_verify_program'
	end

	after :all do
    # Nothing to do
	end
end
