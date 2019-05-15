describe "test3: Testing Framework", :type => :request do

	include_context "Login_Before_All"

	it "Testing example case 3" do
		puts "apex code execution "
		AL.execute_apex_script_from_file "testfile.txt"
		UTIL.min_wait
	end
end