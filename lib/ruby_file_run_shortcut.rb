require("fileutils")
puts "If the file you want to open is the first in this list enter 1 or if it is the second enter 2..."
file_to_run = Dir.glob("lib/*.rb")
file_to_run.each { |files|
  puts files
}
number = gets.chomp
system "ruby #{file_to_run[number.to_i - 1]}"
