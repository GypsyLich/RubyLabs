require_relative './valera.rb'
require "json"

class Menu

  def initialize
    @fileManager = FileManager.new
  end

  def print_stats(valera)
    puts 'Параметры Валеры:'
    puts "Здоровье: #{valera.health} \t Алкомана: #{valera.alcomana}"
    puts "Счастье: #{valera.happy} \t Усталость: #{valera.tired}"
    puts "Деньги: #{valera.money}$\n\n"
  end

  def start_menu
    puts "\e[H\e[2J"
    puts "--------! Marginal Valera The Game !--------\n\n\n"
    puts "1 - Новая игра"
    puts "2 - Загрузить игру"
    puts "3 - Выход"
  end

  def print_actions
    config = @fileManager.load_config
    counter = 1
    config['actions'].each do |action|
      puts "#{counter.to_s} - #{action['name']}"
      counter += 1
    end
  end

  def print_configs
    puts "s - сохранить игру      ||      q - выйти из игры"
  end
end

