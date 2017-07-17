require 'simplecov'
SimpleCov.start do
  add_filter "/test/"

require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/computer'
require './lib/player'

end
