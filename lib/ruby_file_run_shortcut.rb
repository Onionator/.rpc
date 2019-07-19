require("fileutils")
clown_file = File.open("../rpc/clown.txt")
clown = clown_file.read
clown_file.close
puts "~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~\n#{clown}\n~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~\nEnter the number of the ruby file you want to run.\n~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~"
file_to_run = Dir.glob("lib/*.rb")
file_to_run.each_with_index { |files, i|
  puts "#{i + 1}. #{files}"
}
number = Integer(gets.chomp) rescue false
puts "~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~"
if number
system "ruby #{file_to_run[number.to_i - 1]}"
end
