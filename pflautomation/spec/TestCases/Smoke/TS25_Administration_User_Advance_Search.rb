# Including all Page Services
require './lib/PageService/administrationService.rb'
require './lib/PageService/ContactService.rb'

validation_found_msg = "Required Element found on Page"

describe "Verifying the advanced search functionality on User administrator", smoke:true, :type => :request do
	before :all do
		# Nothing to do
	end

	it "TS:01 Verifying the advanced search functionality" do
		logger.info 'Started TC 25 : Verifying the advanced search functionality '
		SFL.login SFRUSER, SFRPASS
		SFL.open_tab $con_tab_swag_IQ_tools
		ADMIN.click_on_user_tile
		ADMIN.click_on_advanced_search_button

		ADMIN.advance_search_using_id_and_value	$admin_user_advance_search_first_name_id,$admin_pfl_bd_auto_user_first_name
		assert_first_name = ADMIN.verify_value_using_advance_search $admin_pfl_bd_auto_user_first_name
		expect(assert_first_name).to eql(true)
		logger.info "Verifying First Name Advanced searching :#{assert_first_name}."


		ADMIN.advance_search_using_id_and_value $admin_user_advance_search_role_id,$admin_pfl_bd_auto_user_role
		assert_role = ADMIN.verify_value_using_advance_search $admin_pfl_bd_auto_user_role
		expect(assert_role).to eql(true)
		logger.info "Verifying Role Advanced searching :#{assert_role}."
		

		ADMIN.advance_search_using_id_and_value $admin_user_advance_search_last_name_id,$admin_pfl_bd_auto_user_last_name
		assert_last_name = ADMIN.verify_value_using_advance_search $admin_pfl_bd_auto_user_last_name
		expect(assert_last_name).to eql(true)
		logger.info "Verifying Last Name Advanced searching :#{assert_last_name}."
		

		ADMIN.advance_search_using_id_and_value $admin_user_advance_search_profile_id,$admin_pfl_bd_auto_user_profile
		assert_profile = ADMIN.verify_value_using_advance_search $admin_pfl_bd_auto_user_profile
		expect(assert_profile).to eql(true)
		logger.info "Verifying Profile Advanced searching :#{assert_profile}."

		ADMIN.search_email_Advance_Search $admin_pfl_bd_auto_user_email
		assert_email = ADMIN.verify_value_using_advance_search $admin_pfl_bd_auto_user_email
		expect(assert_email).to eql(true)
		logger.info "Verifying email Advanced searching :#{assert_email}."

		ADMIN.search_access_level_Advance_Search
		assert_access_level = ADMIN.verify_value_using_advance_search $admin_pfl_bd_auto_user_access_level
		expect(assert_access_level).to eql(true)
		logger.info "Verifying access level Advanced searching :#{assert_access_level}."
		SFL.logout
		logger.info 'Completed Test case 25 . '
	end

	after :all do
	end
end
