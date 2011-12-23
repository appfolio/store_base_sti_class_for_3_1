require 'logger'

ActiveRecord::Base.logger = Logger.new("debug.log")

# GRANT ALL PRIVILEGES ON storebasestiname_unittest.* to 'root'@'localhost';

ActiveRecord::Base.configurations = {
  'unittest' => {
    :adapter  => 'mysql2',
    :username => 'root',
    :encoding => 'utf8',
    :database => 'storebasestiname_unittest',
  }
}

ActiveRecord::Base.establish_connection 'unittest'
