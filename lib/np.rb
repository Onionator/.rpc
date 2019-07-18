#!/usr/bin/env ruby

bender = File.open("bender.txt").read
File.open("bender.txt").close
puts bender


while Dir.pwd != "/Users"
  Dir.chdir ".."
end

user_name = ENV['USER']

Dir.chdir "#{user_name}/desktop"

puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Welcome! To the amazing Ruby Project Creator!"
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"


while true do
  puts "Enter 'q' or 'quit' to exit"
  puts "Enter a project name: "
  user_project_name = gets.chomp
    # this quits the program

  if user_project_name.upcase == "QUIT" || user_project_name.upcase ==  "Q"
    break
  end

  if user_project_name.include?("!$#%^&*(){}[]\"\' /")
    puts "Sorry! No special characters allowed."
    puts "Enter a project name: "
    user_project_name = gets.chomp
    if user_project_name.upcase == "QUIT" || user_project_name.upcase ==  "Q"
      break
    end

  end

  puts "Name your ruby file same as project name? Y/N"
  user_decision = gets.chomp
  if user_decision.upcase == "QUIT" || user_decision.upcase ==  "Q"
    break
  end


  system 'mkdir', "-p", "#{user_project_name}"
  system 'mkdir', "-p", "#{user_project_name}/lib"
  system 'mkdir', "-p", "#{user_project_name}/spec"

  case
  when user_decision == "Y" || user_decision == "y"
    user_ruby_file_name = user_project_name
  when user_decision == "N" || user_decision == "n"
    puts "What should your ruby file be named?"
    user_ruby_file_name = gets.chomp
  end
  system 'touch', "#{user_project_name}/lib/#{user_ruby_file_name}.rb"
  system 'touch', "#{user_project_name}/spec/#{user_ruby_file_name}_spec.rb"

  Dir.chdir "#{user_project_name}"
  system 'bundler init'

  gemfile = File.open('Gemfile', 'w')
  gemfile.puts "# frozen_string_literal: true
  source 'https://rubygems.org'
  gem('pry')
  gem('rspec')
  gem('pivotal_git_scripts')
  git_source(:github) {|repo_name| \"https://github.com/\#{repo_name}\" }
  # gem 'rails'"
  gemfile.close

  system 'bundle install'

  #system doesn't create a gemfile lock for some reason
  system 'touch', 'Gemfile.lock'

  gemfile_lock = File.open('Gemfile.lock', 'w')
  gemfile_lock.puts 'GEM
    remote: https://rubygems.org/
    specs:
      coderay (1.1.2)
      diff-lcs (1.3)
      method_source (0.9.2)
      pivotal_git_scripts (1.4.0)
      pry (0.12.2)
        coderay (~> 1.1.0)
        method_source (~> 0.9.0)
      rspec (3.8.0)
        rspec-core (~> 3.8.0)
        rspec-expectations (~> 3.8.0)
        rspec-mocks (~> 3.8.0)
      rspec-core (3.8.2)
        rspec-support (~> 3.8.0)
      rspec-expectations (3.8.4)
        diff-lcs (>= 1.2.0, < 2.0)
        rspec-support (~> 3.8.0)
      rspec-mocks (3.8.1)
        diff-lcs (>= 1.2.0, < 2.0)
        rspec-support (~> 3.8.0)
      rspec-support (3.8.2)

  PLATFORMS
    ruby

  DEPENDENCIES
    pivotal_git_scripts
    pry
    rspec

  BUNDLED WITH
     2.0.2'

     gemfile_lock.close

     system 'atom .'
     system 'open -a Terminal "`pwd`"'

  Dir.chdir '..'
  # this quits the program
    if user_project_name.upcase == "QUIT" || user_project_name.upcase ==  "Q"
      break
    end














end
