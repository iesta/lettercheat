#!/usr/bin/env ruby

unless ARGV[0]
  puts "Usage : lcheat.rb LETTERS [MINLENGTH:2] [NEEDEDLETTERS]"
  exit
end

words = File.readlines("words_long.txt")

lp = ARGV[0].downcase
minl = ARGV[1].to_i || 2
must = ARGV[2] || ''
hasl = must.downcase.split(//)
need = hasl.size>0
letters = lp.split(//)

f = File.open('logs.txt', 'a')
f.puts ARGV[0]
f.close

#puts "I have #{words.size} words in my dictionnary"
#puts "Scanning best words with #{letters.size} letters : #{ARGV[0]}"

words.each{|w|
#  puts w
  lt = w.chomp.split(//)
  nl = lp.split(//)
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
    if need
      for hh in hasl
        res = false unless w.include?(hh)
      end
    end
    if res
      puts w
    end
  end
}
