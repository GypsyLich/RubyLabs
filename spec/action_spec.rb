require 'rspec'
require_relative '../lib/lab2/actions'

describe Actions do
  describe 'Actions test' do
    let(:action) { Actions.new }
    let(:valera) { Valera.new({ 'health' => 100, 'alcohol' => 0, 'happy' => 0, 'tired' => 0, 'money' => 300 }) }
    let(:config) { FileManager.new.load_config }
    it 'Valera works' do
      valera_exp_work = Valera.new({ 'health' => 100, 'alcohol' => 0, 'happy' => -5, 'tired' => 70, 'money' => 300 })
      action.do_action(config['actions'][0], valera)
      expect(valera).equal?(valera_exp_work)
    end
    it 'Valera contemplates nature' do
      valera_exp_nature = Valera.new({ 'health' => 100, 'alcohol' => 0, 'happy' => 1, 'tired' => 10, 'money' => 300 })
      action.do_action(config['actions'][1], valera)
      expect(valera).equal?(valera_exp_nature)
    end
    it 'Valera drinks and watches TV series' do
      valera_exp_watches = Valera.new({ 'health' => 95, 'alcohol' => 30, 'happy' => -1, 'tired' => 10, 'money' => 280 })
      action.do_action(config['actions'][2], valera)
      expect(valera).equal?(valera_exp_watches)
    end
    it 'Valera went to the bar' do
      valera_exp_bar = Valera.new({ 'health' => 90, 'alcohol' => 60, 'happy' => -1, 'tired' => 40, 'money' => 200 })
      action.do_action(config['actions'][2], valera)
      expect(valera).equal?(valera_exp_bar)
    end
    it 'Drinking with marginal friends' do
      valera_exp_marginal = Valera.new({ 'health' => 20, 'alcohol' => 90, 'happy' => 5, 'tired' => 80, 'money' => 150 })
      action.do_action(config['actions'][2], valera)
      expect(valera).equal?(valera_exp_marginal)
    end
    it 'Sing in the subways' do
      valera_exp_sing = Valera.new({ 'health' => 100, 'alcohol' => 10, 'happy' => 1, 'tired' => 20, 'money' => 310 })
      action.do_action(config['actions'][2], valera)
      expect(valera).equal?(valera_exp_sing)
    end
    it 'Valera slept' do
      valera_exp_slept = Valera.new({ 'health' => 100, 'alcohol' => 0, 'happy' => -3, 'tired' => 0, 'money' => 300 })
      action.do_action(config['actions'][2], valera)
      expect(valera).equal?(valera_exp_slept)
    end
    context 'Minimum and maximum parameters' do
      it 'if the parameter is less than the minimum' do
        valera_exp = Valera.new({ 'health' => 0, 'alcohol' => 0, 'happy' => -10, 'tired' => 0, 'money' => 300 })
        valera_new = Valera.new({ 'health' => -150, 'alcohol' => -250, 'happy' => -300, 'tired' => -400,
                                  'money' => 300 })
        expect(valera_new).equal?(valera_exp)
      end
      it 'if the parameter is greater than the maximum' do
        valera_exp = Valera.new({ 'health' => 100, 'alcohol' => 100, 'happy' => 10, 'tired' => 100, 'money' => 300 })
        valera_new = Valera.new({ 'health' => 150, 'alcohol' => 150, 'happy' => 300, 'tired' => 400, 'money' => 300 })
        expect(valera_new).equal?(valera_exp)
      end
    end
    context 'change attributes' do
      it 'change of health parameter' do
        valera_exp = Valera.new({ 'health' => 100, 'alcohol' => 100, 'happy' => 10, 'tired' => 100, 'money' => 300 })
        action.change_attribute('health', -90, valera_exp)
        expect(valera_exp.health).to eq 10
      end
    end
  end
end
