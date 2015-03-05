require 'spec_helper'
require_relative '../lib/command.rb'

describe 'Command Pattern' do

  describe 'Undo' do
    it 'can be undone' do
      hero = HeroCom.new
      turn = Turn.new
      wood = WoodCommand.new(hero)
      health = HealthCommand.new(hero)

      turn.make_move(wood)
      turn.make_move(health)

      expect(hero.wood).to eq(10)
      expect(hero.health).to eq(5)

      turn.undo_move

      expect(hero.health).to eq(0)
    end
  end

  describe Reactor do
    xit 'is fixed if commands are executed in the right order' do
      computer = Computer.new
      computer.add(AmplifyCommand.new)
      computer.add(CalibrateDriverCommand.new)
      computer.add(TestComplierCommand.new)
      computer.add(InstallRegulatorCommand.new)

      reactor = Reactor.new
      expect(reactor.functional?).to be_false

      reactor.fix(computer.execute)
      expect(reactor.functional?).to be_true
    end
  end

  describe Computer do
    let(:computer) { Computer.new }

    before :each do
      computer.add(CalibrateDriverCommand.new)
      computer.add(TestComplierCommand.new)
    end

    it 'can add commands to its query' do
      expect(computer.queue.size).to eq(2)
    end

    it 'execute all commands in order' do
      expect(computer.execute).to eq %Q{
CalibrateDriverCommand
TestComplierCommand\n}
    end
  end

  describe 'Commands' do
    describe AmplifyCommand do
      it 'applifies shield' do
        command = AmplifyCommand.new
        expect(command.execute).to eq("AmplifyCommand")
      end
    end

    describe CalibrateDriverCommand do
      it 'applifies shield' do
        command = CalibrateDriverCommand.new
        expect(command.execute).to eq("CalibrateDriverCommand")
      end
    end

    describe TestComplierCommand do
      it 'applifies shield' do
        command = TestComplierCommand.new
        expect(command.execute).to eq("TestComplierCommand")
      end
    end

    describe InstallRegulatorCommand do
      it 'applifies shield' do
        command = InstallRegulatorCommand.new
        expect(command.execute).to eq("InstallRegulatorCommand")
      end
    end
  end
end