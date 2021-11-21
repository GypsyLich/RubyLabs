require 'rspec'
require_relative '../lib/lab2/view'
require_relative '../lib/lab2/file_manager'
require_relative '../lib/lab2/valera'

describe View do
  describe 'View test' do
    context '#render' do
      it 'print stats' do
        expect do
          view = View.new
          view.print_stats(Valera.new)
        end.to output("Параметры Валеры:\nЗдоровье: 100 \tОпьянение: 0\nСчастье: 0 \t Усталость: 0\nДеньги: 300$\n\n").to_stdout
      end
      it 'start menu' do
        expect do
          view = View.new('')
          view.start_menu
        end.to output("\n|--------| Приключения Маргинала Валеры |--------|\n\n\n1 - Новая игра\n2 - Загрузить игру\n3 - Выход\n").to_stdout
      end
      it 'print configs' do
        expect do
          view = View.new
          view.print_configs
        end.to output("s - сохранить игру      ||      q - выйти из игры      ||      m - выйти в меню\n").to_stdout
      end
      it 'print exit' do
        expect do
          view = View.new
          view.print_exit
        end.to output("\nВы бросили Валеру\n").to_stdout
      end
      it 'print saved' do
        expect do
          view = View.new
          view.print_saved
        end.to output("\n****Игра сохранена****\nНажмите любую клавишу чтобы продолжить\n").to_stdout
      end
      it 'print error' do
        expect do
          view = View.new
          view.print_error('error')
        end.to output("error\n").to_stdout
      end
      it 'print over' do
        expect do
          view = View.new
          view.game_over
        end.to output("Потрачено\n").to_stdout
      end
    end
  end
end
