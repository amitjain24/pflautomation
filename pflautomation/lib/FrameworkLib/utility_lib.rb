=begin
/* 
* Copyright (c) 2018-2019 PFL. All rights reserved.
*/
=end

require 'capybara'
require 'capybara/dsl'
require 'rspec/core'
require 'capybara/rspec/matchers'
require 'capybara/rspec/features'
require "selenium-webdriver"
require 'capybara/rspec'
require 'pry'
require 'logging'
require 'rspec/logging_helper'
# require './lib/FrameworkLib/global_lib.rb'

extend RSpec::Matchers

module UTIL
extend Capybara::DSL

$DEFAULT_PROPERTY_FILE_NAME ="uitest.run.properties"
$OBJECT_WAIT_LOOP_ITERATION = 10
$GEN_MIN_WAIT = 5
PROPERTY_FILE = ENV['PROPERTY_FILE'] ? ENV['PROPERTY_FILE'] : $DEFAULT_PROPERTY_FILE_NAME


	# Method to check actual value contains expected value.
	# return true/false as execution status.
	def UTIL.include expectedValue, actualValue, tstMsg
		if (expect(actualValue).to include(expectedValue))
			puts "Test Result: #{tstMsg} : Passed."
		else
			raise "Test Result: #{tstMsg} : Failed."
		end
	end
	
	# conversion string to boolean
	# @param is_lightning[String] = it is string variable for lightening/classic identification
	# @return boolean


	def UTIL.convert_to_boolean(is_lightning)
		boolean_convert = is_lightning.strip
		return boolean_convert.downcase == 'true'
	end


	# compare case insensitive for strings
	# @param expectedValue[String] = it is expected value in form of boolean
	# @param actual_value[String] = it is actual value in form of boolean
	# @param tstMsg[String] = it is test message to be displayed with result
	# @return String
	def UTIL.compare_ignore_case expectedValue, actualValue, tstMsg
		if expectedValue.is_a?(String)
			expectedValue = expectedValue.downcase
			actualValue = actualValue.downcase
		end
		if (expect(actualValue).to eql(expectedValue))
			puts "Test #{sTest} Passed."
		end
	end

	# Expected text is not included in the Actual text
	# return true/false as execution status
	def UTIL.not_include expectedValue , actualValue , tstMsg

	end

	# to wait for load page on behalf of an element
	def UTIL.page_load_waiting
		begin
			if(IS_LIGHTNING_ENABLE)
				page.has_css?($sflt_help_button)
			else
				page.has_css?($sfl_app_button)
			end
		rescue
			UTIL.min_wait
		end
	end

	# to wait for certain time(defined in $GEN_MIN_WAIT)
	def UTIL.min_wait
		sleep $GEN_MIN_WAIT
	end

	# to wait for certain time(defined in $GEN_MAX_WAIT)
	def UTIL.max_wait
		sleep $GEN_MAX_WAIT
	end

	# click on a link and wait
	# @param link_name String = name of the link, on which you want to click
	def UTIL.click_link_and_wait link_name
		click_link link_name
		UTIL.min_wait
	end

	# click on a link
	# @param link_name String = name of the link, on which you want to click
	def UTIL.click_link link_name
		click_link link_name
	end

	# to click on any elements
	# @param element_xpath String = xpath of the element, which you want to click
	def UTIL.click_on_element element_xpath
		if(IS_LIGHTNING_ENABLE)
			UTIL.click_on_element_lightning element_xpath
		else
			UTIL.click_on_element_classic element_xpath
		end
	end

	# to click on any elements
	# @param element_xpath String = xpath of the element, which you want to click
	def UTIL.click_on_element_lightning element_xpath
		within_frame(find(:xpath, $admin_lightning_frame)) do
			UTIL.click_on_element_classic element_xpath
		end
	end

	# to click on any elements
	# @param element_xpath String = xpath of the element, which you want to click
	def UTIL.click_on_element_classic element_xpath
		find(:xpath, element_xpath).click
	end
	# read and return property value from uitest.run.properties
	# @param prop_name String = Method will take property value as an parameter
	# @returns text as a value.
	def UTIL.get_property_value prop_name
		property = ""
		File.open(PROPERTY_FILE, "r") do |infile|
			while (row = infile.gets)
				if row.include? prop_name
					property_row = row
				end
			end
			property = property_row.split("=")
		end
		return  property[1].chop
	end

	def UTIL.med_wait
		sleep $GEN_MED_WAIT
	end


	# to wait until the give object(given as a parameter) doesn't appear
	# @param object_path String = xpath of the object, for which you want to wait
	def UTIL.wait_object_appear object_path
		found_status = false
		for i in 1..$OBJECT_WAIT_LOOP_ITERATION do
			begin
				if(object_path[0,1]=='/')
					find(:xpath, object_path,:visible => true, :wait => 30)
					logger.info "Find the path for object"
				else
					find(object_path,:visible => true, :wait => 30)
					puts "Find the path for object1"
				end
				found_status = true
				break
			rescue Exception=>e
				logger.info "Waiting for object to appear times#{i}"
			end
		end
		if(found_status==false)
			logger.error "Exception => #{e.backtrace.join("\n")}"
			raise logger.error "Object not found"
		end
	end

	# to verify the given locator(in form of xpath) on page
	# @param locator_value String = xpath of the locator, you are looking for on the page
	def UTIL.verify_locator_on_page locator_value
		return page.has_xpath? locator_value

	end

# open link in new tab
	def UTIL.open_link_in_new_tab link_name

	end

	# to scroll to a particular element
	# @param obj_locator String = xpath of the element(scroll bar generally)
	def UTIL.scroll_to obj_locator
		begin
			locator_type = :css
			if(obj_locator[0]=='/'  || obj_locator[0,2] == '(/')
			locator_type = :xpath
			end
			script = <<-JS
			arguments[0].scrollIntoView(true);
			JS
			element_position = find(locator_type, obj_locator).native
			Capybara.current_session.driver.browser.execute_script(script, element_position)	
		rescue Exception=>e
				logger.error "#{e.backtrace.join("\n")}"
		end
	end

	# to get a random number
	# @param existing_prg String = name of the program, you want to concatenate with random number
	def UTIL.get_random_number existing_prg
	  random_count = Random.new.rand(1..5000)
		program_name = existing_prg + random_count.to_s
	  return program_name
	end

	# Method to refresh the page
	def UTIL.page_refresh
		page.driver.browser.navigate.refresh
		logger.info "refreshed the page successfully"
		#puts "refreshed the page successfully"
		UTIL.min_wait
	end

	# to verify text value on the page
	# @param text_value String = value the text you want to assert/verify on the page
	def UTIL.verify_text_on_page text_value
		begin
 			page.has_text? text_value
 		rescue Exception=>e
 			logger.error "#{e.backtrace.join("\n")}"
 		end	
	end

	# to compare two values
	# @param value1, value2 String = values which has to be compared
	# @returns true Boolean = if both values are equal, else false
	def UTIL.compare_values value1, value2
		if (value1 == value2)
			return true
		else
			return false
		 end
	end

	# to verify given xpath on the page, whether it is available or not
	# @param path_value String = xpath of the element which has to be verified
	def UTIL.verify_xpath_on_page path_value
		if(IS_LIGHTNING_ENABLE)
			UTIL.verify_xpath_on_page_on_lightening path_value
		else
			UTIL.verify_xpath_on_page_on_classic path_value
		end
	end

	def UTIL.verify_xpath_on_page_on_classic path_value
		logger.info 'Finding Xpath value '
		begin
 			page.has_xpath? path_value
 		rescue Exception=>e
 			logger.error "#{e.backtrace.join("\n")}"
 		end	
	end

	def UTIL.verify_xpath_on_page_on_lightening path_value
		within_frame(find(:xpath, $admin_lightning_frame)) do
			begin
 				page.has_xpath? path_value
 			rescue Exception=>e
 				logger.error "#{e.backtrace.join("\n")}"
 			end	
		end
	end

	# parameter would be passed like :f1,  :f2,  :f3 etc
	# Don't pass parameter as a string
	# #def UTIL.page_refresh
	# 	UTIL.press_keys_on_page :f5
	# 	UTIL.page_load_waiting
	# end


	# parameter would be passed like :f1,  :f2,  :f3 etc
	# Don't pass parameter as a string
	def UTIL.press_keys_on_page key_value
		pageAction = page.driver.browser.action
		pageAction.send_keys(key_value).perform
		UTIL.min_wait
	end


	############################################
	# process_block
	############################################

	# Method used to rexecute code multiple times
	def UTIL.re_execute_script_block (&block)
		success_status=false
		exp = nil
		for i in 1..$SCRIPT_REXECUTION_COUNT do
			begin
				block.call()
			rescue Exception=>e
				logger.info "Script re-execution failed in #{i} attempt with message"
			else
				success_status=true
				break
			end
		end
		if(success_status ==false)
			logger.error "#{e.backtrace.join("\n")}"
			logger.info "Script re_execution failed in all attempt"
			raise e
		end
	end
end
