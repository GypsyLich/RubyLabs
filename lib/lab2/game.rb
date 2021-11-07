require_relative './menu.rb'
require_relative './file_manager.rb'
require "json"
require 'io/console'

class Game

  def initialize
    @menu = Menu.new
    @valera = Valera.new
    @fileManager = FileManager.new
  end

  def action_start_menu
    loop do
      input = STDIN.getch.to_i
      case input
      when 1
        new_game
        return
      when 2
        loadedGame = @fileManager.load_game
        @valera = Valera.new(loadedGame['health'], loadedGame['alcomana'], loadedGame['happy'], loadedGame['tired'], loadedGame['money'])
        new_game
        return
      when 3
        return
      end
    end
  end

  def start
    @menu.start_menu
    action_start_menu
  end

  def paint_new
    puts "\e[H\e[2J"
    @menu.print_stats(@valera)
    @menu.print_actions
    @menu.print_configs
  end

  def change_attr(name, value)
    @valera.send("#{name}=", @valera.send(name) + value)
  end

  def new_game
    @config = @fileManager.load_config
    loop do
      paint_new
      input = STDIN.getch
      #TODO: меню
      case input
      when 'q'
        puts "\nВы бросили Валеру"
        return
      when 's'
        @fileManager.save(@valera)
        puts "\n****Игра сохранена****"
        puts "Нажмите любую клавишу чтобы продолжить"
        STDIN.getch
      end
      input = input.to_i - 1
      next if input < 0 || input > @config['actions'].length - 1
      @config['actions'][input]['result'].each do |effect|
        change_attr(effect['name'], effect['value'])
      end
      break if @valera.dead?
    end
    puts "Потрачено"
  end
end
