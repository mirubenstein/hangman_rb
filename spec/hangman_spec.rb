require 'rspec'
require 'hangman'

describe Hangman do

  it "initializes with a word and number of remaning guesses" do
    new_game = Hangman.new("banana")
    expect(new_game.word).to eq ["b", "a", "n", "a", "n", "a"]
    expect(new_game.guesses_left).to eq 6
    expect(new_game.guessed_word.length).to eq 6
  end

  it "takes in letter from user as guess and checks it vs word" do
    new_game = Hangman.new("banana")
    new_game.guess('a')
    expect(new_game.guesses_left).to eq 5
    expect(new_game.guessed_word).to eq ['_', 'a', '_', 'a', '_', 'a']
  end

  it "adds the letter to the list of guess and subtracts from the number of guesses left" do
    new_game = Hangman.new("banana")
    new_game.guess('a')
    new_game.guess('e')
    expect(new_game.guesses_left).to eq 4
    expect(new_game.guessed_word).to eq ['_', 'a', '_', 'a', '_', 'a']
    expect(new_game.guessed_letters).to eq ['a', 'e']
  end

  it "sets game is won sets boolean" do
    new_game = Hangman.new("cat")
    new_game.guess('c')
    new_game.guess('a')
    new_game.guess('t')
    expect(new_game.won).to eq true
  end

  it "checks to see whether the game is over" do
    new_game = Hangman.new("cat")
    new_game.guesses_left = 0
    expect(new_game.lose).to eq true
  end


end
