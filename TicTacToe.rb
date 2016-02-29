load "./GameBoard.rb"

#FUNCTIONS
def performTurn(player, gb)
	#decide who is playing
	if player == 0
		playerString = "X"
	else
		playerString = "O"
	end

	puts "#{playerString}'s turn! Enter the number of the cell you would like to choose!"
	
	userChoice = nil		
	#Get input
	loop do
		userChoice = gets.to_i
		break unless gb.badInput?(userChoice)
	end

	#Modify gameboard (userChoice-1 instead of userChoice because of indexing)
	gb.cells[userChoice-1] = playerString

	#change turn
	player = (player+1)%2
	return player
end

def playAgain?
	puts "Would you like to play again? Enter (y/n)"
	userChoice = gets.downcase
	if userChoice == 'y'
		return true
	else
		return false
	end
end

#--------------------------------------------------------------------------------------------
#Main Script

puts "Welcome to Tic-Tac-Toe!"

loop do
	#inits
	gb = GameBoard.new()
	turn = 0
	userChoice = nil

	#main game loop
	while gb.winner.nil?
		#print out the board
		gb.printBoard

		#perform the turn. the turn variable will switch between 0 and 1
		turn = performTurn(turn, gb)

		#check for a winner
		gb.checkWinner
	end

	if @winner == "TIE"
		puts "It's a tie!"	
	else
		#print congrats to winner
		puts "Congratulations player #{@winner}! You have won the game!"
	end

	#check if they want to play again
	break unless playAgain?
end

puts "See ya later!"



