# Including all Page Services

require './lib/PageService/LicensesService.rb'
require './lib/PageService/ContactService.rb'
require './lib/PageService/administrationService.rb'

#variables declaration####
name = "Sharma, Deepak"
profile = "Standard User"
title = "Tech Master"
role = "Marketing Manager"
country = "India"
region = "Karnataka"
swag_iq_admin_access = "User"
name_placeholder = "Search Users by Name"
title_placeholder = "Search Users by Title"
profile_placeholder = "Search Users by Profile"
role_placeholder = "Search Users by Role"
country_placeholder = "Search Users by Country"
region_placeholder = "Search Users by Region"
swagiq_admin_access_placeholder =  "Search Users by SwagIQ Admin Access"
profile_checkbox_name = "Profile"
name_checkbox_name = "Name"
title_checkbox_name = "Title"
role_checkbox_name =  "Role"
country_checkbox_name = "Country"
region_checkbox_name = "Region"
swagiq_admin_access_checkbox_name = "SwagIQ Admin Access"
title_column_name = "title"

describe "Verify various functionalities of License page", smoke:true, :type => :request do
	tstMsg = "Required Element found on Page"
	include_context "Login_Before_All"
	before :all do
		# Nothing to do
	end
	it "TS-1: Verify simple search and advance search on license page" do
		logger.info "Started TC-11: Verify various functionalities of License page"
		SFL.open_tab $con_tab_swag_IQ_tools
		LIC.click_licenses_tab
		LIC.expect_tab $licenses_tab
		LIC.expect_tab $licenses_page_header

		assert_status = LIC.verify_licenses_page_header
		expect(assert_status).to eql(true)
		logger.info "Verify License page header : #{assert_status}"

		assert_status = LIC.verify_license_tab_search_text_box
		expect(assert_status).to eql(true)
		logger.info "Verify search text box is present on License page : #{assert_status}"

		assert_status = LIC.assert_columns_on_license_page profile_checkbox_name
		expect(assert_status).to eql(true)
		logger.info "Verify Profile column on license page : #{assert_status}"

		assert_status = LIC.assert_columns_on_license_page name_checkbox_name
		expect(assert_status).to eql(true)
		logger.info "Verify Name column on license page  : #{assert_status}"

		assert_status = LIC.assert_columns_on_license_page title_column_name
		expect(assert_status).to eql(true)
		logger.info "Verify Title column on license page  : #{assert_status}"

		assert_status = LIC.assert_columns_on_license_page role_checkbox_name
		expect(assert_status).to eql(true)
		logger.info "Verify Role column on license page  : #{assert_status}"

		assert_status = LIC.assert_columns_on_license_page country_checkbox_name
		expect(assert_status).to eql(true)
		logger.info "Verify Country column on license page  : #{assert_status}"

		assert_status = LIC.assert_columns_on_license_page region_checkbox_name
		expect(assert_status).to eql(true)
		logger.info "Verify Region column on license page  : #{assert_status}"

		assert_status = LIC.assert_columns_on_license_page swagiq_admin_access_checkbox_name
		expect(assert_status).to eql(true)
		logger.info "Verify SwagIQ Admin Access column on license page  : #{assert_status}"

		assert_status = LIC.perform_search_by $admin_pfl_bd_auto_user_first_name
		expect(assert_status).to eql(true)
		logger.info "Perform search by User Name on license page  : #{assert_status}"

		assert_status = LIC.perform_search_by profile
		expect(assert_status).to eql(true)
		logger.info "Perform search by Profile on license page : #{assert_status}"

		assert_status = LIC.perform_search_by title
		expect(assert_status).to eql(true)
		logger.info "Perform search by Title on license page : #{assert_status}"

		assert_status = LIC.perform_search_by country
		expect(assert_status).to eql(true)
		logger.info "Perform search by Country on license page : #{assert_status}"

		assert_status = LIC.perform_search_by region
		expect(assert_status).to eql(true)
		logger.info "Perform search by Region on license page : #{assert_status}"

		assert_status = LIC.perform_search_by swag_iq_admin_access
		expect(assert_status).to eql(true)
		logger.info "Perform search by SwagIQ Admin Access type on license page : #{assert_status}"

		LIC.click_settings_icon

		assert_status = LIC.perform_advance_search_by $admin_pfl_bd_auto_user_first_name, name_placeholder, name_checkbox_name
		expect(assert_status).to eql(true)
		logger.info "Perform advanced search by User Name on license page : #{assert_status}"
		LIC.click_settings_icon
		LIC.click_clear_button

		assert_status = LIC.perform_advance_search_by title, title_placeholder, title_checkbox_name
		expect(assert_status).to eql(true)
		logger.info "Perform advanced search by Title on license page : #{assert_status}"
		LIC.click_settings_icon
		LIC.click_clear_button

		assert_status = LIC.perform_advance_search_by profile, profile_placeholder, profile_checkbox_name
		expect(assert_status).to eql(true)
		logger.info "Perform advanced search by Profile on license page : #{assert_status}"
		LIC.click_settings_icon
		LIC.click_clear_button

		assert_status = LIC.perform_advance_search_by role, role_placeholder, role_checkbox_name
		expect(assert_status).to eql(true)
		logger.info "Perform advanced search by Role on license page : #{assert_status}"
		LIC.click_settings_icon
		LIC.click_clear_button

		assert_status = LIC.perform_advance_search_by country, country_placeholder, country_checkbox_name
		expect(assert_status).to eql(true)
		logger.info "Perform advanced search by Country on license page : #{assert_status}"
		LIC.click_settings_icon
		LIC.click_clear_button

		assert_status = LIC.perform_advance_search_by region, region_placeholder, region_checkbox_name
		expect(assert_status).to eql(true)
		logger.info "Perform advanced search by Region on license page : #{assert_status}"
		LIC.click_settings_icon
		LIC.click_clear_button

		assert_status = LIC.perform_advance_search_by swag_iq_admin_access, swagiq_admin_access_placeholder, swagiq_admin_access_checkbox_name
		expect(assert_status).to eql(true)
		logger.info "Perform advanced search by SwagIQ Admin Access type on license page : #{assert_status}"
		LIC.click_settings_icon
		LIC.click_clear_button
		logger.info "Completed TC-11: Verify various functionalities of License page"
	end
	after :all do
		#login_salesforce
	end
end
