# Palindrome Syndrome
# Introduction
# A palindrome is a word, phrase, or sequence that reads the same backwards and forwards.

# Problem Statement
# Write out the method palindrome?() that takes in a string as an argument and determines whether that string is a palindrome.

# Example
# palindrome?("racecar") gives a boolean output of true because "racecar" is a palindrome.
# palindrome?("flatiron") gives a boolean output of false because "flatiron" is not a palindrome.
# What would the output for the following strings be?


# Bonus
# Try writing the 'palindrome?' method using string indexes (eg. string = "Flatiron", string[0] = "F")

# SuperBonus
# Try rewriting the palindrome? method as a recursive method without using any built-in Ruby methods.
require 'pry'

def palindrome?(str)
    downcase = str.downcase
    word = downcase.split("")

    new_array = []
    word.each do |a|
        new_array.unshift(a)
    end
    downcase == new_array.join("")

end


def palindrome?(str)
    return true if str.size < 2
    down = str.downcase
    return false if down[0] != down[-1]
    palindrome?(down[1...-1])
end

def palindrome?(str)
    return true if str.size < 2
    down = str.downcase
    while down.size >= 2
        return false if down[0] != down[-1]
        down = down[1...-1]
    end
    return true if down.size < 2
end



p palindrome?("noon")
p palindrome?("five")
p palindrome?("radaR")
p palindrome?("learnlovecode")