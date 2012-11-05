#!/usr/bin/env ruby

unless ARGV[0]
  puts "Usage : lcheat.rb LETTERS [MINLENGTH:2] [NEEDEDLETTERS]"
  exit
end

words = File.readlines("words_long.txt")

#puts "I have #{words.size} words in my dictionnary"

minl = ARGV[1].to_i || 2
must = ARGV[2] || ''
hasl = must.split(//)
letters = ARGV[0].split(//)

f = File.open('logs.txt', 'a')
f.puts ARGV[0]
f.close

#puts "Scanning best words with #{letters.size} letters : #{ARGV[0]}"

words.each{|w|
#  puts w
  lt = w.chomp.split(//)
  nl = ARGV[0].split(//)
  ok = true
  lt.each{|l|
    idx = nl.index(l)
    if idx
      nl[idx]=nil
    else
      ok =false
      break
    end
  }

  if ok && w.size>=minl
    res = true
    if hasl.size>0
      for hh in hasl
        res = false unless w.include?(hh)
      end
    end
    if res
      puts w
    end
  end
}
