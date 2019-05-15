require './lib/FrameworkLib/setup_lib.rb'
require './lib/FrameworkLib/global_lib.rb'
require './lib/FrameworkLib/salesforce_lib.rb'
require './lib/FrameworkLib/salesforce_lightng.rb'
require './lib/FrameworkLib/apex_lib.rb'
require './lib/FrameworkLib/utility_lib.rb'

RSpec.configure do |config|
  config.pattern = '**/*.rb'
  config.example_status_persistence_file_path = RESULT_FILE
  config.run_all_when_everything_filtered = true
  config.fail_fast = false
end
