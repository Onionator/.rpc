require('fileutils')



user_name = ENV['USER']



while Dir.pwd != "/" do
  p Dir.pwd
  FileUtils.cd("..")
end

FileUtils.cd("/Users/#{user_name}/Desktop")
bender_file = File.open("rpc/bender.txt")
bender = bender_file.read
bender_file.close
puts bender
puts "Welcome! To the Amazing Ruby Project Creator!"
puts "What do you want your project to be called?"
user_project_name = gets.chomp
FileUtils.mkdir("#{user_project_name}")
FileUtils.cd("#{user_project_name}")
FileUtils.mkdir("lib")
FileUtils.mkdir("spec")
FileUtils.touch("lib/#{user_project_name}.rb")
FileUtils.touch("spec/#{user_project_name}_spec.rb")
FileUtils.touch("Gemfile")
File.open("Gemfile", "w") {
  |file| file.write(
    "# frozen_string_literal: true
    source \'https://rubygems.org\'
    gem('pry')
    gem('rspec')
    gem('pivotal_git_scripts')
    git_source(:github) {|repo_name| \'https://github.com/\#{repo_name}\' }
    ")}
FileUtils.touch("Gemfile.lock")
system 'bundle install'
system 'atom .'
system 'open -a Terminal "`pwd`"'
