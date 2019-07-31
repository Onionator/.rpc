require('fileutils')
user_name = ENV['USER']
while Dir.pwd != "/" do
  p Dir.pwd
  FileUtils.cd("..")
end
FileUtils.cd("/Users/#{user_name}/Desktop")
bender_file = File.open(".rpc/bender.txt")
bender = bender_file.read
bender_file.close
puts bender
puts "Welcome! To the Amazing Ruby Project Creator!"
puts "What do you want your project to be called?"
user_project_name = gets.chomp
if user_project_name.upcase != "Q" && user_project_name.upcase != "QUIT"
  FileUtils.mkdir("#{user_project_name}")
  FileUtils.cd("#{user_project_name}")
  FileUtils.mkdir("lib")
  FileUtils.mkdir("spec")
  FileUtils.mkdir("views")
  FileUtils.touch("lib/#{user_project_name}.rb")
  FileUtils.touch("spec/#{user_project_name}_spec.rb")
  FileUtils.touch("spec/#{user_project_name}_integration_spec.rb")
  FileUtils.touch("views/index.erb")
  FileUtils.touch("app.rb")
  File.open("lib/#{user_project_name}.rb", "w") {
    |file| file.write(
      "require 'pry'")}
      FileUtils.touch("spec/#{user_project_name}_spec.rb")
  File.open("spec/#{user_project_name}_spec.rb", "w") {
    |file| file.write(
      "require 'rspec'\nrequire '#{user_project_name}'")}
      FileUtils.touch("Gemfile")
  File.open("Gemfile", "w") {
    |file| file.write(
      "source \'https://rubygems.org\'\ngem('pry')\ngem('rspec')\ngem('sinatra')\ngem('sinatra-contrib')\ngem('capybara')
      ")}
  FileUtils.touch("Gemfile.lock")
  system 'atom .'
  system 'open -a Terminal "`pwd`"'
  system 'gem install -g'
end
