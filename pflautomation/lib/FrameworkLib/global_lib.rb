=begin
/* 
* Copyright (c) 2018-2019 PFL. All rights reserved.
*/
=end

require './lib/FrameworkLib/utility_lib.rb'
#require './lib/FrameworkLib/global_lib.rb'

# Constant variables to be used

# Set general variable values through environmental variables or property file.
$SALESFORCE_URL = "https://login.salesforce.com/"
$TEST_EXE_RESULT_FILE = "TestExecutionResult.txt"
$TEST_HTML_RESULT_FILE = "Test-Result-execution-lightning.html"
$LOG_FILE = "Test-executionlog.log"
$TEST_HTML_RE_RUN1_RESULT_FILE = "Test-Result-execution-lightning-ReRunResult-1.html"
$TEST_HTML_RE_RUN2_RESULT_FILE = "Test-Result-execution-lightning-ReRunResult-2.html"
$TEST_HTML_RE_RUN3_RESULT_FILE = "Test-Result-execution-lightning-ReRunResult-3.html"
$TEST_CLASSIC_HTML_RESULT_FILE = "Test-Result-execution-classic.html"
$TEST_CLASSIC_HTML_RE_RUN1_RESULT_FILE = "Test-Result-execution-classic-ReRunResult-1.html"
$TEST_CLASSIC_HTML_RE_RUN2_RESULT_FILE = "Test-Result-execution-classic-ReRunResult-2.html"
$TEST_CLASSIC_HTML_RE_RUN3_RESULT_FILE = "Test-Result-execution-classic-ReRunResult-3.html"

$SCRIPT_REXECUTION_COUNT = 6
$GEN_MIN_WAIT = 5
$GEN_MAX_WAIT = 10
$GEN_MED_WAIT = 8
$SALESFORCE_USERNAME = "username"
$SALESFORCE_PASSWORD = "password"
$DEFAULT_PROPERTY_FILE_NAME ="uitest.run.properties"
$OBJECT_WAIT_LOOP_ITERATION = 15
$STORE_VALUE = " "
$TIMESTAMP = DateTime.now.strftime('%Y%m%d_%H%M%S')

SFUSER = ENV['SFUSER'] ? ENV['SFUSER'] : UTIL.get_property_value("sfuser")
SFPASS = ENV['SFPASS'] ? ENV['SFPASS'] : UTIL.get_property_value("sfpass")
SFSUSER = ENV['SFSUSER'] ? ENV['SFSUSER'] : UTIL.get_property_value("sfsuser")
SFSPASS = ENV['SFSPASS'] ? ENV['SFSPASS'] : UTIL.get_property_value("sfspass")
SFAUSER = ENV['SFAUSER'] ? ENV['SFAUSER'] : UTIL.get_property_value("sfauser")
SFAPASS = ENV['SFAPASS'] ? ENV['SFAPASS'] : UTIL.get_property_value("sfapass")
SFNUSER = ENV['SFNUSER'] ? ENV['SFNUSER'] : UTIL.get_property_value("sfnuser")
SFNPASS = ENV['SFNPASS'] ? ENV['SFNPASS'] : UTIL.get_property_value("sfnpass")
SFRUSER = ENV['SFRUSER'] ? ENV['SFRUSER'] : UTIL.get_property_value("sfruser")
SFRPASS = ENV['SFRPASS'] ? ENV['SFRPASS'] : UTIL.get_property_value("sfrpass")
TAG1 = ENV['TAG1'] ? ENV['TAG1'] :UTIL.get_property_value("tag1")
TAG2 = ENV['TAG2'] ? ENV['TAG2'] :UTIL.get_property_value("tag2")
TAG3 = ENV['TAG3'] ? ENV['TAG3'] :UTIL.get_property_value("tag3")
LIGHTNING = ENV['LIGHTNING'] ? ENV['LIGHTNING'] : UTIL.get_property_value("islightning")

IS_LIGHTNING_ENABLE = UTIL.convert_to_boolean(LIGHTNING)

RESULT_FILE = ENV['RESULT_FILE'] ? ENV['RESULT_FILE'] : $TEST_EXE_RESULT_FILE
RESULT_FILE1 = ENV['RESULT_FILE1'] ? ENV['RESULT_FILE1'] : $TEST_HTML_RESULT_FILE
RESULT_FILE2 = ENV['RESULT_FILE2'] ? ENV['RESULT_FILE2'] : $TEST_HTML_RE_RUN1_RESULT_FILE
RESULT_FILE3 = ENV['RESULT_FILE3'] ? ENV['RESULT_FILE3'] : $TEST_HTML_RE_RUN2_RESULT_FILE
RESULT_FILE4 = ENV['RESULT_FILE4'] ? ENV['RESULT_FILE4'] : $TEST_HTML_RE_RUN3_RESULT_FILE
RESULT_FILE5 = ENV['RESULT_FILE5'] ? ENV['RESULT_FILE5'] : $TEST_CLASSIC_HTML_RESULT_FILE
RESULT_FILE6 = ENV['RESULT_FILE6'] ? ENV['RESULT_FILE6'] : $TEST_CLASSIC_HTML_RE_RUN1_RESULT_FILE
RESULT_FILE7 = ENV['RESULT_FILE7'] ? ENV['RESULT_FILE7'] : $TEST_CLASSIC_HTML_RE_RUN2_RESULT_FILE
RESULT_FILE8 = ENV['RESULT_FILE8'] ? ENV['RESULT_FILE8'] : $TEST_CLASSIC_HTML_RE_RUN3_RESULT_FILE

LOGFILE = ENV['LOGFILE'] ? ENV['LOGFILE'] : $LOG_FILE
MAIL_RECIPIENT = ENV['MAIL_RECIPIENT'] ? ENV['MAIL_RECIPIENT'] : UTIL.get_property_value("mail.recipient")
USER_MAIL = ENV['NOTIFY_USER'] ? ENV['NOTIFY_USER'] : UTIL.get_property_value("mail.user_name")
USER_PASSWORD = ENV['NOTIFY_PASSWORD'] ? ENV['NOTIFY_PASSWORD'] : UTIL.get_property_value("mail.user_password")

	# Reference URL: https://	github.com/TwP/logging
	#https://ruby-doc.org/stdlib-2.2.3/libdoc/logger/rdoc/Logger.html
	# DEBUG < INFO < WARN < ERROR < FATAL < UNKNOWN
	#generic delegator class for multiple targets
class MultiDelegator
  def initialize(*targets)
    @targets = targets
  end

  def self.delegate(*methods)
    methods.each do |m|
      define_method(m) do |*args|
        @targets.map { |t| t.send(m, *args) }
      end
    end
    self
  end

  class <<self
    alias to new
  end
end

#creates a Logger that outputs to the standard output stream, with a level of INFO:
	def logger
		log_file = File.open($LOG_FILE, File::WRONLY | File::APPEND | File::CREAT)
		logger = Logger.new MultiDelegator.delegate(:write, :close).to(STDOUT, log_file)
		logger.level = Logger::INFO
		logger.formatter = proc do |severity, datetime, progname, msg|
        	date_format = datetime.strftime("%Y-%m-%d %H:%M:%S")
	    	if severity == "INFO" or severity == "WARN" or severity == "ERROR"
	        	"[#{date_format}] #{severity}  (#{progname}): #{msg}\n"
	    	else
	        	"[#{date_format}] #{severity} (#{progname}): #{msg}\n"
	    	end
		end
		logger
	end

	# to enter username and password on login page, and click on login within salesforce application
	def login_salesforce
		window_maximize
		
			
		UTIL.re_execute_script_block do
			logger.info 'Browser launched and navigae to URL'
			visit $SALESFORCE_URL
			UTIL.wait_object_appear $sfl_username
			fill_in $SALESFORCE_USERNAME, with: SFUSER
			fill_in $SALESFORCE_PASSWORD, with: SFPASS
			click_button "Login"
			logger.info 'User loggin Successfully'
		end
		if(page.has_xpath?($sfl_close_lighting_option))
			find(:xpath, $sfl_close_lighting_option).click
		end
		UTIL.page_load_waiting
		SFL.verify_login_on_required_version

		# Capybara.save_and_open_page_path = "./results/screenshots"
		# Capybara::Screenshot.register_driver(:chrome) do |driver, path|
		# 	driver.browser.save_screenshot(path)
		# end
	end

	# to click on any element appear on salesforce page, excluding third party application(without iframe)
	def click_on_element xpath
		find(:xpath, xpath).click
		UTIL.min_wait
	end

	# to set the value of the parameter
	def getvalue param_value
		$STORE_VALUE = param_value
	end

	# to compare the actual and expected result values(boolen)
	# @param expectedValue String = it is expected value in form of String
	# @param actual_value String = it is actual value in form of String
	# @param tstMsg String = it is test message to be displayed with result
	def assert_values_and_report_result expectedValue, actual_value, tstMsg
		if (expect(actual_value).to eql(expectedValue))
			logger.info "Comparison: #{tstMsg} : Passed."
		else
			raise "Comparison: #{tstMsg} : Failed."
		end
	end

	def assert_values_and_report_result result, tstMsg
		if (result)
			logger.info "Comparison: #{tstMsg} : Passed."
		else
			raise "Comparison: #{tstMsg} : Failed."
		end
	end
	

	# its a context, which contains functionality of login function, which takes place in before_all section
	shared_context "Login_Before_All" do
		before :all do
			login_salesforce
		end
	end

	# its a context, which contains functionality of login function, which takes place in before_each section
	shared_context "Login_Before_Each" do
		before :each do
			login_salesforce
		end
	end
