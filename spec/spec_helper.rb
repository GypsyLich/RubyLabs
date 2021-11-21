require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
  add_filter '/lib/lab2/game.rb'
  add_filter '/lib/lab2/view.rb'
end
SimpleCov.minimum_coverage 90
