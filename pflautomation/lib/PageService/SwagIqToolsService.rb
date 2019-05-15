# Copyright PFL, All rights reserved.
# Any unauthorized use, copying or sale of the above may constitute an infringement of copyright and may
# result in criminal or other legal proceedings.

module SWQR
extend RSpec::Matchers
extend Capybara::DSL


	#Locators
	$swqr_new_rule = "//a[contains(text(), 'New Rule')]";
	$swqr_rule_name = "//label[contains(text(), 'Rule Name')]/..//div//input";
	$swqr_rule_description = "//label[contains(text(), 'Description')]/..//div//textarea";
	$swqr_rule_select_obj = "//label[contains(text(), 'Object')]/..//div//select";
	$swqr_rule_select_trigger = "//label[contains(text(), 'Trigger Type')]/..//div//select";
	$swqr_rule_select_send_type = "//label[contains(text(), 'Send Type')]/..//div//select";
	$swqr_rule_select_send_recipient_address = "//label[contains(text(), 'Recipient Address')]/..//div//select";
	$swqr_rule_is_active = "//span[contains(text() , 'Is Active')]/..//span[2]";
	$swqr_rule_gift = "//a[contains(text() , 'Gift...')]";
	$swqr_radio_button_created_everytime_edited = "label[class*='radio'] input[id$='1']";
	$swqr_select_rule_evaluation = "//select[contains(@name, 'ruleEvaluationTypeField')]";
	$swqr_select_assignment_type = "//select[contains(@name, 'assignationType')]";
	$swqr_select_activate_rule = "//span[contains(@class, 'slds-checkbox--faux')]";
	$swqr_select_i_love_swag = "//ul[contains(@class, 'dropdown__list')]//li//label[contains(text(), 'I Love Swag\" Coffee Mug Starbucks VIA')]";
	$swqr_save_button =  "//a[contains(text(), 'Save')]";

	#Select and Label Values
	$swqr_select_value_CONTACT = "Contact";
	$swqr_select_value_WORKFLOW = "Workflow";
	$swqr_select_value_TIME_BASED = "Time Based";
	$swqr_select_value_auto_send = "Auto Send";
	$swqr_select_value_create_task = "Create Task";
	$swqr_select_value_contact_mailing_address = "Contact Mailing Address";
	$swqr_select_value_formula_evaluate_true = "Formula evaluates to true";

	#########################################
	# Swag Iq Rule object setter and getter methods
	##########################################

	#unused method
	def SWQR.edit_swag_iq_rule rule_name
		UTIL.re_execute_script_block do
			find(:xpath, "//a[contains(text(), '"+rule_name+"')]/ancestor::tr[1]//td[2]//a[contains(@title, 'Edit')]").click
		end
		UTIL.page_load_waiting
	end

	#unused method
	def SWQR.set_rule_active
		UTIL.re_execute_script_block do
			find(:xpath, $swqr_rule_is_active).click
		end
		UTIL.page_load_waiting
	end

	# unused method
	def SWQR.click_save
		UTIL.re_execute_script_block do
			find(:xpath, $swqr_save_button).click
		end
		UTIL.page_load_waiting
	end
end
