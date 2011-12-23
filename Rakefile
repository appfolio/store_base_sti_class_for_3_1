require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "store_base_sti_class_for_3_1"
  gem.homepage = "http://github.com/appfolio/store_base_sti_class_for_3_1"
  gem.license = "MIT"
  gem.summary = %Q{
    Modifies ActiveRecord 3.1.x with the ability to store the actual class (instead of the base class) in polymorhic _type columns when using STI
  }
  gem.description = %Q{
    ActiveRecord has always stored the base class in polymorphic _type columns when using STI. This can have non-trivial
    performance implications in certain cases. This gem adds 'store_base_sti_class' configuration options which controls
    whether ActiveRecord will store the base class or the actual class. Default to true for backwards compatibility.
  }
  gem.email = "andrew.mutz@appfolio.com"
  gem.authors = ["Andrew Mutz"]
  
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "store_base_sti_class_for_3_1 #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

namespace :mysql do
  desc 'Build the MySQL test databases'
  task :build_databases do
    %x( echo "create DATABASE storebasestiname_unittest DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_unicode_ci " | mysql --user=root)
  end

  desc 'Drop the MySQL test databases'
  task :drop_databases do
    %x( mysqladmin --user=root -f drop storebasestiname_unittest )
  end

  desc 'Rebuild the MySQL test databases'
  task :rebuild_databases => [:drop_databases, :build_databases]
end

