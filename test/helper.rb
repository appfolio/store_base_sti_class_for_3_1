require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'test/unit'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'store_base_sti_class_for_3_1'

require 'connection'

# silence verbose schema loading
original_stdout = $stdout
$stdout = StringIO.new
begin
  require "schema.rb"
ensure
  $stdout = original_stdout
end

require 'models'
