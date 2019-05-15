require 'rspec/core/rake_task'
require './lib/FrameworkLib/global_lib.rb'
require './lib/FrameworkLib/mail_lib.rb'

task :executesingletestcase, [:testcase] do |t, args|
  puts "Running Tests  #{args.testcase}"
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = "spec/TestCases/Smoke/#{args.testcase}"
  end
	begin
	Rake::Task["spec"].execute
	rescue Exception => e
		# do Nothing
	end
end

	#(excuteRegressioncase, task to execute smoke suit)
	#@param reexeCount , number of time want to retry scripts in failure.
	#@param testcaseFile , test suit file containing test cases want to execute.
	# @output, generate final execution result an send mail
task :excuteRegressioncase, [:reexeCount, :testcaseFile] do |t, args|
	puts "Executing Testcases from file: #{args.testcaseFile}"
	reexeCount=args.reexeCount
	testcaseFile=args.testcaseFile

	if reexeCount == nil || reexeCount == ""
	 reexeCount = 3 #default reexecution Count count
	end

	if testcaseFile == nil || testcaseFile == ""
	 testcaseFile = "regressionSuit.txt" #default testcase file
	end

	testcaseList = getlistofTestCases("spec/TestCases/UI_Regression/#{testcaseFile}")
	outputFile = "Test-Result-execution"

  puts "check and remove executionlog.log file if exists"
  File.delete(LOGFILE) if File.exist?(LOGFILE)

  puts "check and remove TestExecutionResult.txt file if exists"
  File.delete(RESULT_FILE) if File.exist?(RESULT_FILE)
  File.delete(RESULT_FILE1) if File.exist?(RESULT_FILE1)
  File.delete(RESULT_FILE2) if File.exist?(RESULT_FILE2)
  File.delete(RESULT_FILE3) if File.exist?(RESULT_FILE3)
  File.delete(RESULT_FILE4) if File.exist?(RESULT_FILE4)
  File.delete(RESULT_FILE5) if File.exist?(RESULT_FILE5)
  File.delete(RESULT_FILE6) if File.exist?(RESULT_FILE6)
  File.delete(RESULT_FILE7) if File.exist?(RESULT_FILE7)
  File.delete(RESULT_FILE8) if File.exist?(RESULT_FILE8)

	puts "Execute test cases multiple time"
	RSpec::Core::RakeTask.new(:spec) do |t|
		t.pattern = testcaseList
		t.rspec_opts = "--require spec_helper --color --format progress --format html --out #{outputFile}.html"
	end
	begin
	Rake::Task["spec"].execute
	rescue Exception => e
		#do Nothing
	ensure
		 executeFailedCases(reexeCount,testcaseList,outputFile)
	end
end

	#(excuteSmokecase, task to execute smoke suit)
	#@param reexeCount , number of time want to retry scripts in failure.
	#@param testcaseFile , test suit file containing test cases want to execute.
	# @output, generate final execution result an send mail
task :excuteSmokecase, [:reexeCount, :testcaseFile] do |t, args|
	puts "Executing Testcases from file: #{args.testcaseFile}"
	reexeCount=args.reexeCount
	testcaseFile=args.testcaseFile
	puts testcaseFile

	if reexeCount == nil || reexeCount == ""
	 reexeCount = 3 #default reexecution Count count
	end

	if testcaseFile == nil || testcaseFile == ""
	 testcaseFile = "smokeSuit.txt" #default testcase file
	end

	testcaseList = getlistofTestCases("spec/TestCases/Smoke/#{testcaseFile}")
	if(IS_LIGHTNING_ENABLE)
		outputFile = "Test-Result-execution-lightning"
	else
		outputFile = "Test-Result-execution-classic"
	end

  puts "check and remove executionlog.log file if exists"
  File.delete(LOGFILE) if File.exist?(LOGFILE)

  puts "check and remove TestExecutionResult.txt and .html file if exists"
  File.delete(RESULT_FILE) if File.exist?(RESULT_FILE)
  File.delete(RESULT_FILE1) if File.exist?(RESULT_FILE1)
  File.delete(RESULT_FILE2) if File.exist?(RESULT_FILE2)
  File.delete(RESULT_FILE3) if File.exist?(RESULT_FILE3)
  File.delete(RESULT_FILE4) if File.exist?(RESULT_FILE4)
  File.delete(RESULT_FILE5) if File.exist?(RESULT_FILE5)
  File.delete(RESULT_FILE6) if File.exist?(RESULT_FILE6)
  File.delete(RESULT_FILE7) if File.exist?(RESULT_FILE7)
  File.delete(RESULT_FILE8) if File.exist?(RESULT_FILE8)

	puts "Execute test cases multiple time"
	RSpec::Core::RakeTask.new(:spec) do |t|
		t.pattern = testcaseList
		if  (TAG1 ==" " && TAG2 == " " && TAG3 == " ")
			t.rspec_opts = "--require spec_helper --color --format progress --format html --out #{outputFile}.html"
		else
			puts TAG1
			puts TAG2
			puts TAG3

			t.rspec_opts = "--tag "+TAG1+" --tag "+TAG2+" --tag "+TAG3+" --require spec_helper --color --format progress --format html --out #{outputFile}.html"
		end
	end
	begin
	Rake::Task["spec"].execute
	rescue Exception => e
		#do Nothing
	ensure
		 executeFailedCases(reexeCount,testcaseList,outputFile)
	end
end

#get number of test cases passed and failed from result file
def getTestCasePassFailCount
    no_fail = 0
	no_pass = 0
	if ! File.exist?(RESULT_FILE)
	   return 0,0
	end
	File.open(RESULT_FILE, "r") do |infile|
		while (row = infile.gets)
			if row.include? "failed"
				no_fail = no_fail + 1
			elsif row.include? "passed"
				no_pass = no_pass + 1
			end
		end
	end
	return  no_pass,no_fail
end

#read file and return list of spec files to run
def getlistofTestCases fileName
	testcaselist = Array.new
	File.open(fileName, "r") do |infile|
		while (row = infile.gets)
			if !(row[0]=="#")
				testcaselist.push(row.chop)
			end
		end
	end
	return testcaselist
end

def executeFailedCases reexeCount, testcaseList,outputFile
	pass_count,fail_count = getTestCasePassFailCount
	puts "#{Time.now.strftime('%d/%m/%Y %H:%M')}: Test execution Status Status;  passed : #{pass_count} failed : #{fail_count}"

	executionStatus = Array.new
	executionNumber = reexeCount

	executionStatus.push("#{Time.now.strftime('%d/%m/%Y %H:%M')}: Test execution Status Status;  passed : #{pass_count} failed : #{fail_count}")
	reexeNo=1

	while (reexeNo<=executionNumber.to_i && (fail_count >0)) do
		begin
			RSpec::Core::RakeTask.new(:spec2) do |t|
				t.pattern = testcaseList
				executionStatusFile = "#{outputFile}-ReRunResult-#{reexeNo}.html"
				t.rspec_opts ="--only-failure --require spec_helper --color --format progress --format html --out #{executionStatusFile}"
			 end
			Rake::Task[:spec2].execute
			rescue Exception => e
			## exception handling
		end
		Rake::Task[:spec2].clear

		#getting pass fail count
		pass_count,fail_count = getTestCasePassFailCount
		puts "#{Time.now.strftime('%d/%m/%Y %H:%M')}: Result after rerun: #{reexeNo} examples passed : #{pass_count} failed : #{fail_count}"
		executionStatus.push("#{Time.now.strftime('%d/%m/%Y %H:%M')}: Result after rerun #{reexeNo} examples -> passed : #{pass_count} failed : #{fail_count}")
		reexeNo=reexeNo+1
	end
	puts "Final Result after Smoke test file execution"
	puts executionStatus
	notifyResultOfrakeExecution
	if(fail_count > 0)
	  raise 'Test script failed'
	end
end

def notifyResultOfrakeExecution
	puts "sending email of test result to: #{MAIL_RECIPIENT}"
	if  !(MAIL_RECIPIENT =="" || MAIL_RECIPIENT == nil)
		to = MAIL_RECIPIENT
		from = "PFL Auto Tester"
		if(IS_LIGHTNING_ENABLE)
		subject = "AutoTester:PFL test execution for SF Ligtening #{Time.now.strftime("%d/%m/%Y")}"
		else
		subject = "AutoTester:PFL test execution for SF Classic #{Time.now.strftime("%d/%m/%Y")}"
		end
		body = "Test Case Execution execution Result ; Get the attached file"

    #Attached txt and html execution result file to email
    	attachfile =  RESULT_FILE
		attachfile =  RESULT_FILE1
		attachfile =  RESULT_FILE2
		attachfile =  RESULT_FILE3
    	attachfile =  RESULT_FILE4
    	attachfile =  RESULT_FILE5
    	attachfile =  RESULT_FILE6
    	attachfile =  RESULT_FILE7
    	attachfile =  RESULT_FILE8
    	attachfile =  LOGFILE

		MAIL.sendmail to, from, subject, body, attachfile
		puts "Email sent successfully"
	else
		puts "Mail can not send coz MAIL_RECIPIENT property value not get"
	end
end
