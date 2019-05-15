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
require 'capybara-screenshot'
require 'capybara-screenshot/rspec'
require './lib/FrameworkLib/utility_lib.rb'

# Constant variables to be used.
$downloadFilePath ='/downloadfiles/'
$APP_URL = "https://login.salesforce.com"							#"https://test.salesforce.com/"
$window_os='Windows'
$mac_os='Mac'
OSTYPE = ENV['OSTYPE'] ? ENV['OSTYPE'] : UTIL.get_property_value("os_type")
DRIVER = ENV['DRIVER'] ? ENV['DRIVER'] : UTIL.get_property_value("driver")

	#Capybara.default_max_wait_time = 5

	# Register different drivers with Capybara
	 Capybara.register_driver :chrome do |app|
	 options = Selenium::WebDriver::Chrome::Options.new
	 options.add_argument("--disable-notifications")
	 options.add_argument("--safebrowsing-disable-auto-update")
	 Capybara::Selenium::Driver.new(app, {:browser => :chrome, :options=> options})
	 end


	Capybara.register_driver :safari do |app|
		Capybara::Selenium::Driver.new(app, :browser => :safari)
	end

	Capybara.register_driver :firefox do |app|
		Capybara::Selenium::Driver.new(app, :browser => :firefox, :marionette => true, :args => args)
	end

	Capybara.register_driver :internet_explorer do |app|
		Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
	end

	#Screen shot support code on chrome browser
	Capybara.save_and_open_page_path = "./results/screenshots"
	Capybara::Screenshot.register_driver(:chrome) do |driver, path|
		driver.browser.save_screenshot(path)
	end


	if DRIVER == "firefox"
		Capybara.default_driver = :selenium
	elsif DRIVER == "chrome"
		Capybara.default_driver = :chrome

	elsif DRIVER == "safari"
		Capybara.default_driver = :safari

	elsif DRIVER == "internet_explorer"
		Capybara.default_driver = :internet_explorer
	end

	unless DRIVER == "firefox" || DRIVER == "chrome" || DRIVER == "safari" || DRIVER == "internet_explorer" || DRIVER == "SAUCE"
		raise "You must or DRIVER=chrome or DRIVER=safari or DRIVER=firefox or DRIVER=internet_explorer to the beginning of your command"
	end

	$supported_pdf_drivers = ["firefox"]

	# configuring capybara
	Capybara.configure do |con|
		con.app_host = $APP_URL
		con.ignore_hidden_elements = false
		con.run_server = false
		con.match =:prefer_exact
		con.default_max_wait_time = 5 # the default time is 2 seconds
		if (DRIVER == "firefox" || DRIVER == "chrome" || DRIVER == "safari" || DRIVER == "internet_explorer")
			con.current_session.driver.browser.manage.window.maximize
		end
	end

	# configuring rspec
	RSpec.configure do |con|
		con.include Capybara::DSL, :type => :request
		con.include Capybara::DSL, :type => :acceptance
		con.include Capybara::RSpecMatchers, :type => :request
		con.include Capybara::RSpecMatchers, :type => :acceptance
		con.after do
			Capybara.use_default_driver
			Capybara.current_session.driver.quit
		end
		con.before do  
			Capybara.use_default_driver
 		end
	end

	# browser window maximize 
	def window_maximize
		if (DRIVER == "firefox" || DRIVER == "chrome" || DRIVER == "safari" || DRIVER == "internet_explorer")
			Capybara.current_session.driver.browser.manage.window.maximize
		end
	end

	# Set Current OS
	$current_os=$window_os

	if (OSTYPE==$window_os)
		$current_os=$window_os
	else
		$current_os=$mac_os
	end
