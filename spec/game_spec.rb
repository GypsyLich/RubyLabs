require 'rspec'
require_relative '../lib/lab2/game'
require_relative './mocks/file_manager_mock'
require_relative './mocks/input_mock'
require_relative './mocks/view_mock'
require_relative '../lib/lab2/game_states'

describe Game do
  describe 'Save and load file' do
    let(:game) { Game.new }
    let(:valera_expected) { Valera.new }
    let(:valerabb) { Valera.new }
    let(:config) { FileManager.new.load_config }
    it 'Valera work' do
      game.do_action_json(config['actions'][0])
      expect(game.get_valera) == valera_expected
    end
    it 'save works' do
      game = Game.new(ViewMock.new, FileManagerMock.new, InputMock.new('s'))
      state, valera = game.game_step(FileManagerMock.new.load_config, Valera.new, nil)
      expect(state).to eq 1
    end
    it 'menu works' do
      game = Game.new(ViewMock.new, FileManagerMock.new, InputMock.new('m'))
      state, valera = game.game_step(FileManagerMock.new.load_config, Valera.new, nil)
      expect(state).to eq 0
    end
  end
end
