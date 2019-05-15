#-------------------------------------------------------------------#
# 	Pre-Requisit: Ensure required Data Created
#  	Product Area: Send Swag
# 	Story: Testing Automation
#------------------------------------------
#Including all Page Services
require './lib/PageService/ContactService.rb'
require './lib/PageService/administrationService.rb'

# All local variables
product_qan = '2'
product_c1 = 1

describe "Verify that tasks are created when SwagIQ Order status is changed to Order Confirmed, Shipped and Delivered", smoke:true, sendswag:true, :type => :request do
	validation_found_msg = "Required Element found on Page"
	include_context "Login_Before_All"

	before :all do
        logger.info 'Started Before Block - TC18: Verify that tasks are created when SwagIQ Order status is changed to Order Confirmed, Shipped and Delivered'
		SFL.open_tab $con_tab_contacts
		SFL.select_list_view $con_view_pfl
		CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
		CON.click_on_send_marketing_button
		CON.select_contact_Address
		CON.click_use_this_address_buttons
		CON.click_program_on_contact_send_marketing_page  $admin_bd_auto_program_1, $admin_bd_auto_product_1
		CON.click_send_marketing_next_button
		CON.click_send_marketing_confirmation_msg
		CON.click_send_marketing_materials_button

		confirmation_msg = CON.verify_send_swag_confirmation_msg
        expect(confirmation_msg).to eql(true)
        logger.info "Verify send swag confirmation message : #{confirmation_msg}"

		
        CON.click_canvas_ok

		status = CON.verify_swag_iq_order_status_under_related_list $admin_bd_auto_product_1, $admin_bd_auto_program_1, $con_order_status_submitted
        expect(status).to eql(true)
        logger.info "Verify swag iq order status under related list is - Submitted : #{status}"		
		
        SFL.logout
        logger.info 'Completed Before Block - TC18: Verify that tasks are created when SwagIQ Order status is changed to Order Confirmed, Shipped and Delivered'
	end

    it "TS-1: Verify that tasks are created Under Activity History when SwagIQ Order status changed to Order Confirmed/Shipped/Delivered" do
        logger.info 'Starting TC-18: Verify that tasks are created Under Activity History when SwagIQ Order status changed to Order Confirmed'
		SFL.login SFUSER, SFPASS
        SFL.open_tab $con_tab_contacts
        SFL.select_list_view $con_view_pfl
        CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name

        CON.click_swag_iq_order_edit_button_under_related_list $admin_bd_auto_product_1, $admin_bd_auto_program_1, $con_order_status_submitted
        CON.set_contact_status_picklist_value_under_tracking_information_relatedlist $con_order_status_order_confirmed
        CON.click_save_button

        SFL.open_tab $con_tab_contacts
        SFL.select_list_view $con_view_pfl
        CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name

        status = CON.verify_swag_iq_task_under_related_list $admin_bd_auto_product_1, $admin_bd_auto_program_1 , $con_order_status_order_confirmed
        expect(status).to eql(true)
        logger.info "Verify swag iq order status under related list is - confirmed : #{status}"     

        logger.info 'Verify that tasks are created Under Activity History when SwagIQ Order status changed to Shipped'

        SFL.open_tab $con_tab_contacts
        SFL.select_list_view $con_view_pfl
        CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name

        CON.click_swag_iq_order_edit_button_under_related_list $admin_bd_auto_product_1, $admin_bd_auto_program_1, $con_order_status_order_confirmed
        CON.set_contact_status_picklist_value_under_tracking_information_relatedlist $con_order_status_shipped
        CON.click_save_button

        SFL.open_tab $con_tab_contacts
        SFL.select_list_view $con_view_pfl
        CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name

        status = CON.verify_swag_iq_task_under_related_list $admin_bd_auto_product_1, $admin_bd_auto_program_1 , $con_order_status_shipped
        expect(status).to eql(true)
        logger.info "Verify swag iq order status under related list is - shipped : #{status}"     

        logger.info 'Verify that tasks are created Under Activity History when SwagIQ Order status changed to Delivered'

        SFL.open_tab $con_tab_contacts
        SFL.select_list_view $con_view_pfl
        CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name

        CON.click_swag_iq_order_edit_button_under_related_list $admin_bd_auto_product_1, $admin_bd_auto_program_1, $con_order_status_shipped
        CON.set_contact_status_picklist_value_under_tracking_information_relatedlist $con_order_status_delivered
        CON.click_save_button

        SFL.open_tab $con_tab_contacts
        SFL.select_list_view $con_view_pfl
        CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name

        status = CON.verify_swag_iq_task_under_related_list $admin_bd_auto_product_1, $admin_bd_auto_program_1 , $con_order_status_delivered
        expect(status).to eql(true)
        logger.info "Verify swag iq order status under related list is - delivered : #{status}"     

        SFL.logout
        logger.info 'Completed TC-18 it block'
	end

    after :all do
        logger.info 'Entering into After All Block TC:18 --'
        SFL.login SFUSER, SFPASS
        SFL.open_tab $con_tab_contacts
	    SFL.select_list_view "PFL Auto Contact"
        CON.open_contact $con_bd_auto_contact_first_name, $con_bd_auto_contact_last_name
        CON.delete_swag_iq_order_status_under_related_list $admin_bd_auto_product_1, $admin_bd_auto_program_1, $con_order_status_delivered
        SFL.logout
        logger.info 'Test Case Completed TC:18 --'
    end
end
