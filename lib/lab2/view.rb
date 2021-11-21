require_relative './valera'
require 'json'

class View
  def initialize(clear_screen_symbol = "\e[H\e[2J")
    @file_manager = FileManager.new
    @clear_screen_symbol = clear_screen_symbol
  end

  def ui(valera, error)
    puts @clear_screen_symbol
    print_stats(valera)
    print_actions
    print_configs
    print_error(error) if error
  end

  def print_stats(valera)
    puts 'Параметры Валеры:'
    puts "Здоровье: #{valera.health} \tОпьянение: #{valera.alcohol}"
    puts "Счастье: #{valera.happy} \t Усталость: #{valera.tired}"
    puts "Деньги: #{valera.money}$\n\n"
  end

  def start_menu
    puts @clear_screen_symbol
    puts "|--------| Приключения Маргинала Валеры |--------|\n\n\n"
    puts '1 - Новая игра'
    puts '2 - Загрузить игру'
    puts '3 - Выход'
  end

  def print_actions
    config = @file_manager.load_config
    counter = 1
    config['actions'].each do |action|
      puts "#{counter} - #{action['name']}"
      counter += 1
    end
  end

  def print_configs
    puts 's - сохранить игру      ||      q - выйти из игры      ||      m - выйти в меню'
  end

  def print_exit
    puts "\nВы бросили Валеру"
  end

  def print_saved
    puts "\n****Игра сохранена****"
    puts 'Нажмите любую клавишу чтобы продолжить'
  end

  def print_error(error)
    puts error
  end

  def game_over
    puts 'Потрачено'
  end
end
