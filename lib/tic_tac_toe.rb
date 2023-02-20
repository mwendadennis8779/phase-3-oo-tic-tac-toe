class TicTacToe
    
    

    def initialize()
        @board = Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


#   converts the  input from a string to an integer
  def input_to_index(input)
    input.to_i-1
  end


  def move(index, token)
    @board[index] = token
  end

# determines the if the position on the board is taken
   def position_taken?(index)
    @board[index] != " "
  end
# Checks if the move is  between index 1-8 and is on the board
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

# Calculates the number of mocves made by each token
  def turn_count
    @board.count do |token|
        token == "X" || token == "O"
    end
  end

# Determines the players turn by evaluating the turn count. if the number is even its it the  turn to play "X"
  def current_player
     self.turn_count.even? ? "X" : "O"
  end



  def turn
    # puts " Enter a position between 1-9"
    input = gets
    entry = input_to_index(input)

    if valid_move?(entry)
        move(entry, current_player)
        display_board
    else
        turn
    end


  end


  # Checks if a player has a winning combination
  def won?
    WIN_COMBINATIONS.detect do |combo|
    #  combo =[0,1,2]
    #  board[combo[0]]   board[combo[1]]  board[combo[2]]
     position_taken?(combo[0]) &&
     @board[combo[0]] == @board[combo[1]] &&
     @board[combo[1]] == @board[combo[2]]
   end
        
  end

# Checks if all slots on the board have been couppied
  def full?
     @board.all? do |token|
        token == "X"  || token == "O"
     end
    # !@board.include?("")
  end

  # Checks if the game is a draw
  def draw?
    full? && !won?
  end

  # Checks if the game is over
  def over?
    draw? || won?
  end

#  Reaturns the token that has won the game
  def winner
    if won?
        current_player == "X"? "O": "X"
    end

  end

  def play
    until over?
        turn
    end

    if won?
        puts "Congratulations #{winner}!"
    elsif draw?
        puts "Cat's Game!"
    end
        


  end
  
end