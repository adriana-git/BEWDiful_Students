#!/usr/bin/env ruby


puts "+++++++++++++++++++++++++++++++++++++++++++++"
puts "+    Welcome to the Guess-a-Number game.    +"
puts "+        Created by Adriana Henriquez       +"
puts "+++++++++++++++++++++++++++++++++++++++++++++"
print "+ Let's get started. What's your name? >>  "

name = gets.chomp

puts "+ Hi #{name}. Nice to meet you. Let's play."
puts "+ Rules of the game are simple. "
puts "+ Guess a number between 1 and 10"
puts "+ Guess the number within 3 tries and you win."
puts "+ Ready? Let's start."

user_guess = 0;
attempt = 0;
target = 9;

#Initiate While Loop to meet req of 3 attempts

while attempt < 3 && user_guess.to_i != target
	attempt = attempt + 1

	print "+ Guess a number:"
	user_guess = gets.chomp

	if user_guess.to_i == target
		puts "+ Yay! You Win!"
	elsif (user_guess.to_i > target)
		puts "+ Sorry! Try lower."
		puts "+ You have #{3 - attempt.to_i} attempts left"
	else
		puts "+ Sorry! Try higher."
		puts "+ You have #{3 - attempt.to_i} attempts left"
	end
	if attempt == 3 && user_guess.to_i != target 
		puts "+ You exceeded your allotted attempts."
	end
end