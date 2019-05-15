=begin
/* 
* Copyright (c) 2018-2019 PFL. All rights reserved.
*/
=end

module AL
extend Capybara::DSL

    # selectors and messages
    $al_execution_result_div = "//textarea/../following-sibling::div//span//b"
    $al_execution_text_area = "//textarea"
    $al_execute_button = "//input[contains(@value, 'Execute Apex')]"
    $al_successfully_executed_msg = "Script executed successfully."

    # Methods to execute apex code from file
    # File name containing apex code would be passed as an argument  AL.execute_apex_script_from_file testfile.txt
    # method will assert execution status message after executing code
    def AL.execute_apex_script_from_file file_name
        apex_script = ""
        File.open("./uploadfiles/"+ file_name , "r") do |infile|
            while (row = infile.gets)
                apex_script += row  
            end
        end
        AL.execute_apex_script apex_script
    end

    def AL.execute_apex_script script
        SFL.open_all_tabs
        SFL.open_tab "apexExecution"
        find(:xpath, $al_execution_text_area).set script
        find(:xpath, $al_execute_button ).click();
        UTIL.min_wait
        UTIL.wait_object_appear $al_execution_result_div
    end
end