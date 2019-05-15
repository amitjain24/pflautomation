# Including all Page Services
require './lib/PageService/ContactService.rb'
require './lib/PageService/administrationService.rb'

#variables declaration
tstMsg = "element found"
first_n_value = "Ramesh kumar"
last_n_value = "sharma"
mailing_address_street = "4/16 kcc nagar, ajmer road"
mailing_address_zipcode = 323001
mailing_country_value = "India"

describe "Verify that user can't do send swag if recipient doesn't have complete address", smoke:true, sendswag:true, :type => :request do
	validation_found_msg = "Required Element found on Page"
	validation_found_msg1 = "Verify confirmation msg on send swag :"

	#include_context "Login_Before_All"

	before :all do
		# Nothing to do
	end

	it "Verify that after clicking send swag, user gets address page to fill in if he has incomplete address" do
		logger.info "Started TC-15: Verify that after clicking send swag, user gets address page to fill in if he has incomplete address "
		SFL.login SFNUSER, SFNPASS
		SFL.open_tab $con_tab_contacts
		SFL.create_new_contact first_n_value, last_n_value, mailing_address_street, mailing_address_zipcode, mailing_country_value
		UTIL.page_load_waiting
		CON.click_on_send_marketing_button

		assert_status = UTIL.verify_xpath_on_page $con_send_swag_select_address
		expect(assert_status).to eql(true)
		logger.info "Required Element found on Page contact address icon :#{assert_status}."

		CON.select_contact_Address
		CON.click_use_this_address_buttons

		assert_status = UTIL.verify_xpath_on_page $con_error_city_is_required
		expect(assert_status).to eql(true)
		logger.info "Required Element found on Page city is required :#{assert_status}."

		assert_status = UTIL.verify_xpath_on_page $con_error_state_is_required
		expect(assert_status).to eql(true)
		logger.info "Required Element found on Page state is required :#{assert_status}."

		assert_status = UTIL.verify_xpath_on_page $con_error_phone_is_required
		expect(assert_status).to eql(true)
		logger.info "Required Element found on Page phone is required :#{assert_status}."

		CON.fill_other_address $con_other_city_field, $con_other_city_field_valid_value
		CON.fill_other_address $con_other_state_field, $con_other_state_field_valid_value
		CON.fill_other_address $con_other_phone_number, $con_other_phone_number_valid_value
		CON.click_custom_use_this_address
		CON.click_program_on_contact_send_marketing_page $admin_bd_auto_program_1, $admin_bd_auto_product_1
		CON.click_send_marketing_next_button
		CON.click_send_marketing_confirmation_msg
		CON.click_send_marketing_materials_button

		assert_confirmation = CON.verify_send_swag_confirmation_msg
		expect(assert_confirmation).to eql(true)
		logger.info "Verify confirmation msg on send swag :#{assert_confirmation}."

		CON.click_canvas_ok
		SFL.logout
		logger.info 'Completed Test case 15 . '
	end

	after :all do

	end
end
