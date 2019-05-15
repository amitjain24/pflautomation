# Including all Page Services
require './lib/PageService/ContactService.rb'
require './lib/PageService/SwagIqOrderService.rb'
require './lib/PageService/administrationService.rb'

# variable declaration
tstMsg = "searched element"

describe "Verify length validation on Custom Address form during Send Swag", smoke:true, :type => :request do
	validation_found_msg = "Required Element found on Page"

	before :all do
	# Nothing to do
	end

	it "TS-1: Verify that if limit exceeds of the entered text in input boxes then it produces validation error" do
		logger.info "Started TC-16: Verify that if limit exceeds of the entered text in input boxes then it produces validation error"
		SFL.login SFNUSER, SFNPASS
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl
		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.click_on_send_marketing_button
		CON.click_on_other_address_button
		CON.fill_other_address $con_other_address_line1, $con_other_address_line1_value
		CON.fill_other_address $con_other_address_line2, $con_other_address_line2_value
		CON.fill_other_address $con_other_city_field, $con_other_city_field_value
		CON.fill_other_address $con_other_state_field, $con_other_state_field_value
		CON.fill_other_address $con_other_postal_code, $con_other_postal_code_value
		CON.fill_other_address $con_other_postal_country, $con_other_postal_country_value
		CON.fill_other_address $con_other_phone_number, $con_other_phone_number_value
		CON.fill_other_address $con_other_company_name, $con_con_other_company_name_value

		assert_status = SWIQODR.assert_error_on_custom_address $con_error_other_name_address1
		expect(assert_status).to eql(true)
		logger.info "Verify error message for the field Address Line 1 : #{assert_status}"

		assert_status = SWIQODR.assert_error_on_custom_address $con_error_other_name_address2
		expect(assert_status).to eql(true)
		logger.info "Verify error message for the field Address Line 2 : #{assert_status}"

		assert_status = SWIQODR.assert_error_on_custom_address $con_error_other_name_city
		expect(assert_status).to eql(true)
		logger.info "Verify error message for the field City : #{assert_status}"

		assert_status = SWIQODR.assert_error_on_custom_address $con_error_other_name_state
		expect(assert_status).to eql(true)
		logger.info "Verify error message for the field State : #{assert_status}"

		assert_status = SWIQODR.assert_error_on_custom_address $con_error_other_name_country
		expect(assert_status).to eql(true)
		logger.info "Verify error message for the field Country : #{assert_status}"

		assert_status = SWIQODR.assert_error_on_custom_address $con_error_other_name_phone_name
		expect(assert_status).to eql(true)
		logger.info "Verify error message for the field Phone : #{assert_status}"

		assert_status = SWIQODR.assert_error_on_custom_address $con_error_other_name_company_name
		expect(assert_status).to eql(true)
		logger.info "Verify error message for the field Company : #{assert_status}"

		assert_status = SWIQODR.assert_error_on_custom_address $con_error_other_name_postal_code
		expect(assert_status).to eql(true)
		logger.info "Verify error message for the field Postal Code : #{assert_status}"

		CON.fill_other_address $con_other_address_line1, $con_other_address_line1_valid_value
		CON.fill_other_address $con_other_address_line2, $con_other_address_line2_valid_value
		CON.fill_other_address $con_other_city_field, $con_other_city_field_valid_value
		CON.fill_other_address $con_other_state_field, $con_other_state_field_valid_value
		CON.fill_other_address $con_other_postal_code, $con_other_postal_code_valid_value
		CON.fill_other_address $con_other_postal_country, $con_other_postal_country_valid_value
		CON.fill_other_address $con_other_phone_number, $con_other_phone_number_valid_value
		CON.fill_other_address $con_other_company_name, $con_con_other_company_name_valid_value

		CON.click_custom_use_this_address
		CON.click_program_on_contact_send_marketing_page $admin_bd_auto_program_1, $admin_bd_auto_product_1
		CON.click_send_marketing_next_button
		CON.click_send_marketing_confirmation_msg
		CON.click_send_marketing_materials_button

		assert_confirmation = CON.verify_send_swag_confirmation_msg
		expect(assert_confirmation).to eql(true)
		logger.info "Verify Send Swag confirmation message : #{assert_confirmation}"

		CON.click_canvas_ok

		status = CON.verify_swag_iq_order_status_under_related_list $admin_bd_auto_product_1, $admin_bd_auto_program_1 , $con_order_status_submitted
		expect(status).to eql(true)
		logger.info "Verify SwagIQ order status equals Submitted under related list : #{status}"

		SFL.logout
		logger.info "Completed TC-16: Verify that if limit exceeds of the entered text in input boxes then it produces validation error"
  end

  after :all do
		logger.info 'Entering into After All Block TC:16 --'
		SFL.login SFUSER, SFPASS
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl
		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.delete_swag_iq_order_status_under_related_list $admin_bd_auto_product_1, $admin_bd_auto_program_1, $con_order_status_submitted
		logger.info 'Test Case Completed TC:16 --'
  end
end
