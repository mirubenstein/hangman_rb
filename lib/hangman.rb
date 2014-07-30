class Hangman

  attr_accessor(:word, :guesses_left, :guessed_word, :bad_guesses, :guessed_letters)

  def initialize(word)
    @word = word.split("")
    @guesses_left = 6
    @guessed_word = ['_'] * @word.length
    @guessed_letters = []
  end

  def guess(letter)
    if @guessed_letters.include?(letter)
      return "Already guessed"
    end
    @guesses_left -= 1
    @guessed_letters << letter
    if @word.include?(letter)
      @word.map.with_index do |l, i|
        if l == letter
          @guessed_word[i] = letter
        end
      end

      if won?
        puts "you win"
      end
    else
      if lose?
        puts "you lose"
      end
    end
  end

  def won?
    return @word == @guessed_word && guesses_left > 0
  end

  def lose?
    return @word != @guessed_word && guesses_left <= 0
  end

end

new_game = Hangman.new("cat")
puts new_game.guess('c')
puts new_game.guess('a')
puts new_game.guess('b')
puts new_game.guess('d')
puts new_game.guess('e')
puts new_game.guess('f')


puts new_game.guessed_word
