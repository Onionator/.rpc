require("fileutils")
user_name = ENV["USER"]
location = Dir.pwd
while Dir.pwd != "/" do
  FileUtils.cd("..")
end
FileUtils.cd("/Users/#{user_name}/Desktop")
clown_file = File.open("/Users/#{user_name}/Desktop/.rpc/clown.txt")
clown = clown_file.read
clown_file.close
FileUtils.cd("#{location}")
puts "~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~\n#{clown}\n~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~\nEnter the number of the ruby file you want to run.\n~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~"
puts "~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~"
system "ruby app.rb"
