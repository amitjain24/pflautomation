#-------------------------------------------------------------------#
# 	Pre-Requisit: Ensure required Data Created
#  	Product Area: Send Swag
# 	Story: Testing Automation
#------------------------------------------
# Including all Page Services
require './lib/PageService/ContactService.rb'

describe "Verify that validation message displayed to user, if no program is associated to user on Send swag Screen", UI:true, smoke:true, :type => :request do
	validation_found_msg = "Send Swag Required Element found on Page"
	before :all do
		# Nothing to do
	end

	it "TS-1: Verify that validation message displayed to user if no program is associated  to user on send swag screen" do
		logger.info 'Started  TC-20.FOR Verify that validation message displayed to user if no program is associated  to user on send swag screen'
		SFL.login SFAUSER, SFAPASS
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl

		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.click_on_send_marketing_button
		CON.select_contact_Address
		CON.click_use_this_address_buttons
		UTIL.page_load_waiting

    #Asserting validation message
		validation_assertion = CON.verify_no_product_available_on_send_swag
		expect(validation_assertion).to eql(true)
		logger.info "Verify error msg if no program associated with User  : #{validation_assertion} "
		UTIL.min_wait
		SFL.logout
		logger.info 'completed for TC:20 ....' 
	end

	after :all do
    # Nothing to do
	end
end
