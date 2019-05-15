# Copyright PFL, All rights reserved.
# Any unauthorized use, copying or sale of the above may constitute an infringement of copyright and may
# Result in criminal or other legal proceedings.

module SWIQODR
extend RSpec::Matchers
extend Capybara::DSL

###################################################
# Swag IQ Order object locators
###################################################
#variables declaration####

###################################################
# Swag IQ Order Messages and Labels
###################################################
$swiqodr_label_send_mechanism = "Send Mechanism"
$swiqodr_label_reason = "Reason"
$swag_iq_order_page_title = "//h2[contains(text(), ' Swag Order - SwagIQ')]"
$swag_iq_order_reason_contact_title_change = "Contact Title Change"

###################################################
# Swag IQ Order Status and labels
###################################################
$swiqodr_status_in_progress = "In Progress"
$swiqodr_status_order_confirmed = "Order Confirmed"
$swagodr_no_product_found = "//label[contains(.,'No products found.')]"
#########################################
# Swag IQ Order object setter and getter methods
##########################################

	# unused method
	def SWIQODR.get_field_value_for_label label_value
		UTIL.re_execute_script_block do
			return find(:xpath, "//td[contains(text(), '"+label_value+"')]/..//div").text
		end
	end

	# to assert the error message while filling other address for a contact, during send marketing materials
	# @param error_name = name of the error/error text, you want to assert on the page
	def  SWIQODR.assert_error_on_custom_address error_name
		if(IS_LIGHTNING_ENABLE)
			SWIQODR.assert_error_on_custom_address_on_lightning error_name
		else
			SWIQODR.assert_error_on_custom_address_on_classic error_name
		end
	end

	def SWIQODR.assert_error_on_custom_address_on_lightning error_name
		within_frame(find(:xpath, $con_lightning_frame)) do
			SWIQODR.assert_error_on_custom_address_on_classic error_name
		end
	end

	# to assert the error message while filling other address for a contact, during send marketing materials
	# @param error_name = name of the error/error text, you want to assert on the page
	def SWIQODR.assert_error_on_custom_address_on_classic error_name
		page.has_xpath?("//div/span[contains(.,'"+error_name+"')]")
	end
end
