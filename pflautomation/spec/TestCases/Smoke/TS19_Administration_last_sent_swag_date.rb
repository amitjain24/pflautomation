# Including required Page lib
require './lib/PageService/ContactService.rb'
require './lib/PageService/administrationService.rb'

# variables declaration
blankdate = ""
tstMsg = "comparison of current date and last sent swag date: "

describe "Verifying that Swag Last Sent Date field on the Contact object is updated when send swag performed", smoke:true, sendswag:true, :type => :request do
	validation_found_msg = "Required Element found on Page"
	validation_found_msg1 = "Verify confirmation msg on send swag :"
	validation_found_msg2 = "Verify SwagIQ Order Under related list :"
	
	before :all do
		logger.info 'Before Block  TC-19.FOR Verifying that Swag Last Sent Date field on the Contact object is updated when send swag performed'
		SFL.login SFUSER, SFPASS
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl
		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.change_swag_last_sent_date blankdate
		puts "logging out successfully"
		SFL.logout
		logger.info 'Before Block completed for TC:19' 
	end

	it "TS-01: Verify that Swag Last Sent Date field updated when Swag swag performed on contact" do
		logger.info 'Started TC 19 : Verify that Swag Last Sent Date field updated when Swag swag performed on contact'
		SFL.login SFRUSER, SFRPASS
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl

		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.click_on_send_marketing_button
		CON.select_contact_Address
		CON.click_use_this_address_buttons
		CON.click_program_on_contact_send_marketing_page $admin_bd_auto_program_1, $admin_bd_auto_product_1
		CON.click_send_marketing_next_button
		CON.click_send_marketing_confirmation_msg
		CON.click_send_marketing_materials_button

		confirmation_msg = CON.verify_send_swag_confirmation_msg
		expect(confirmation_msg).to eql(true)
		logger.info "confirmation msg appears after send swag  : #{confirmation_msg} "

		CON.click_canvas_ok

		status = CON.verify_swag_iq_order_status_under_related_list $admin_bd_auto_product_1, $admin_bd_auto_program_1 , $con_order_status_submitted
		expect(status).to eql(true)
		logger.info "Verify the SwagIQ Order Under Related list  : #{status} "

		current_date  = CON.get_todays_date
    	last_send_swag_date = CON.get_swag_last_sent_date

		assert_status = CON.compare_last_send_swag_date_with_today current_date, last_send_swag_date
		expect(assert_status).to eql(true)
		logger.info "Verify that Swag Last Date is Today  : #{status} "

		SFL.logout
		logger.info 'Completed Test Step -1 for  TC:19'
	end

	after :all do
		logger.info 'Entering into After All Block TS:19 --'
		SFL.login SFUSER,SFPASS
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl

		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.delete_swag_iq_order_status_under_related_list $admin_bd_auto_product_1, $admin_bd_auto_program_1, $con_order_status_submitted
		logger.info 'Test Case Completed TS:19 --'
	end
end
