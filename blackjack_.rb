def calculate_total(cards)
	arr = cards.map{|e| e[0]}

	total = 0
		arr.each do |value|

			if value == "A"
				total += 11
			elsif value.to_i == 0
				total = total + 10
			else
				total += value.to_i
			end
		end

		#correct for Aces
		arr.select {|e| e == "A"}.count.times do
			total -= 10 if total > 21

		end

	total
end


puts "Welcome to Blackjack"

suits = ["hearts", "diamonds", "spades", "clubs"]
cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king", "ace"]
deck = cards.product(suits)

deck.shuffle!

#Deal Cards
my_cards = []
dealer_cards = []

my_cards << deck.pop
dealer_cards << deck.pop
my_cards << deck.pop
dealer_cards << deck.pop

puts my_cards.to_s
puts dealer_cards.to_s

dealer_total = calculate_total(dealer_cards)
my_total = calculate_total(my_cards)

# Show cards
puts "Dealer has: #{dealer_cards[0]} and #{dealer_cards[1]} for a total of #{my_total}"
puts "You have: #{my_cards[0]} and #{my_cards[1]} for a total of #{my_total}" 

puts "What would you like to do? 1) Hit 2) Stay"
hit_or_stay = gets.chomp

