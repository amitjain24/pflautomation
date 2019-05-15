# Including Page Services
require './lib/PageService/LicensesService.rb'
require './lib/PageService/ContactService.rb'
require './lib/PageService/administrationService.rb'

## variable declaration###
validation_found_msg = "Required Element found on Page"

describe "Verify that License tab is visible to user, after assigning permission(Assign permission set) for custom profile", smoke:true, :type => :request do
# include_context "Login_Before_All"
	before :all do
		logger.info 'Started Before Block - TC10'
		SFL.login SFUSER, SFPASS
		#SFL.check_created_profile $sfl_required_profile_name, $required_profile_xpath, $assign_p_set_checked   ###change the name of the variable as discussed with team
		SFL.check_user_profile $sfl_required_profile_name, $standard_user_full_name1
		SFL.logout
		logger.info 'Completed Before Block - TC10'
 	end

	it "TS-1: verifying through the custom user profile" do
		logger.info "Started TC-10: Verify that License tab is visible to user, after assigning permission(Assign permission set) for custom profile"
		SFL.login SFNUSER, SFNPASS
		SFL.open_tab $con_tab_swag_IQ_tools

		license_tab_status = UTIL.verify_xpath_on_page $license_tab_locator
		expect(license_tab_status).to eql(true)
		logger.info "Verify that License tab is visible to user : #{license_tab_status}"

		LIC.click_licenses_tab
		SFL.logout
		logger.info 'Completed Test case 10'
  end

  after :all do
		logger.info 'Entering into After All Block TC:10 --'
		SFL.login SFUSER, SFPASS
		SFL.set_back_profile $con_standard_profile_name, $standard_user_full_name1
		SFL.logout
		logger.info 'Test Case Completed TC:10 --'
  end
end
