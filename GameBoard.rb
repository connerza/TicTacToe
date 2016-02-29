#GAMEBOARD CLASS
class GameBoard

	def initialize
		@cells = [1,2,3,4,5,6,7,8,9]
		@winner = nil
	end
	
	def printBoard
		i = 0
		3.times do
			3.times do
				print "#{@cells[i].to_s} "
				i += 1
			end
			print "\n" 
		end

		print "\n\n\n"
	end

	def isFull?
		for cell in @cells
			if cell.is_a? Integer 
				return false
			end
		end
		return true
	end

	def checkWinner
		#check if its a tie
		if self.isFull?
			@winner = "TIE"
			return
		end

		tracker = [0, nil]

		#check horizontal
		@cells.each_with_index do |cell, i|
			#reset for new horizontal
			if i % 3 == 0
				tracker = [0, nil]
			end

			if cell == tracker[1]
				tracker[0] += 1
			else
				tracker = [0, cell]
			end

			if tracker[0] == 2
				@winner = tracker[1]
				return
			end
		end

		#reset tracker
		tracker = [0, nil]

		#check vertical
		base = 0
		i = nil
		3.times do
			i = base
			tracker = [0, nil]
			3.times do
				if @cells[i] == tracker[1]
					tracker[0] += 1
				else
					tracker = [0, @cells[i]]
				end
				i += 3

				if tracker[0] == 2
					@winner = tracker[1]
					return
				end
			end
			base += 1
		end

		#reset tracker
		tracker = [0, nil]

		#check l-r diag
		i = 0
		3.times do
			if @cells[i] == tracker[1]
				tracker[0] += 1
			else
				tracker = [0, @cells[i]]
			end

			if tracker[0] == 2
				@winner = tracker[1]
				return
			end
			i += 4
		end

		#reset tracker
		tracker = [0, nil]

		#check r-l diag
		i = 2
		3.times do
			if @cells[i] == tracker[1]
				tracker[0] += 1
			else
				tracker = [0, @cells[i]]
			end

			if tracker[0] == 2
				@winner = tracker[1]
				return
			end
			i += 2
		end

	end

	def badInput?(userChoice)
		if @cells[userChoice-1] == 'X' or @cells[userChoice-1] == 'O'
			puts "That cell has already been chosen! Try again!"
			return true
		end

		if userChoice-1 > 8 or userChoice-1 < 0
			puts "That cell number is invalid! Try again!"
			return true
		end

		return false
	end

	def cells
		@cells
	end

	def cells=(newVal)
		@cells = newVal
	end

	def winner
		@winner
	end
end
