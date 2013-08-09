puts "Welcome to blackjack"

def card_total(cards)
	card_value = cards.map{|c| c[0]}

	total = 0
	card_value.each do |value|
		if value == "ace"
			total += 11
		elsif value.to_i == 0
			total += 10
		else
			total += value.to_i
		end
	end

	#correct for Aces
	card_value.select{|c| c == "ace"}.count.times do
		total -= 10 if total > 21
	end

	total

end

suit = %w[clubs spades diamonds hearts]
cards = %w[ 2 3 4 5 6 7 8 9 10 jack queen king ace]


deck = cards.product(suit)
player_cards = []
dealer_cards = []

deck.shuffle!

player_cards << deck.pop
dealer_cards << deck.pop
player_cards << deck.pop
dealer_cards << deck.pop

player_total = card_total(player_cards)
dealer_total = card_total(dealer_cards)

puts "Player has #{player_cards} for a total of #{player_total}"
puts "Dealer has #{dealer_cards} for a total of #{dealer_total}"

puts ""

if dealer_total == 21
	puts "Sorry Dealer hit BLACKJACK. YOU LOST"
	exit
end

#Player Turn
if player_total == 21
	puts "Congratulations, you hit blackjack, you win"
	exit
end

while player_total < 21
	puts "What would you like to do? 1) hit 2) stay"
	hit_or_stay = gets.chomp

	if !['1', '2'].include?(hit_or_stay)
		puts "Please enter a 1 or 2"
		next
	end

	if hit_or_stay == "2"
		puts "You have chosen to stay"
		break
	end

	#hit
	new_card = deck.pop
	puts "Dealing card to player: #{new_card}"
	player_cards << new_card
	player_total = card_total(player_cards)
	puts "Your total now is: #{player_total}"

	if player_total == 21
		puts "Congratulationsm you hit blackjack. You Win"
		exit
	elsif player_total > 21
		puts "Sorry you BUST!"
		exit
	end
end

#Dealer Turn
if dealer_total == 21
	puts "Sorry, dealer hit blackjack. You LOSE!"
	exit
end

while dealer_total < 17
	#hit
	new_card = deck.pop
	puts "Dealing a new card to the dealer: #{new_card}"
	dealer_cards << new_card
	dealer_total = card_total(dealer_cards)
	puts "Dealer total is now #{dealer_total}"

	 if dealer_total == 21
	 	puts "Sorry, dealer hit blackjack. You LOSE"
	 	exit
	 elsif dealer_total > 21
	 	puts "Congrats! You made the Dealer BUST! You WIN"
	 	exit
	 end
end

#Compare hands

puts "Dealers cards: "
dealer_cards.each do |card|
	puts "=> #{card}"
end

puts ""

if dealer_total > player_total
	puts "Sporry, dealer wins"
elsif dealer_total < player_total
	puts "Congrats man. you win"
else
	puts "Its a tie... LAME"
end
exit

