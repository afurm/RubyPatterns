class Turn
  def initialize
    @moves = []
  end

  def make_move(move)
    move.execute
    @moves << move
  end

  def undo_move
    @moves.pop.unexecute
  end
end

class HeroCom
  attr_accessor :wood, :health, :money

  def initialize
    @wood = 0
    @health = 0
    @money = 0
  end
end

class WoodCommand
  def initialize(hero)
    @hero = hero
  end

  def execute
    @hero.wood += 10
  end

  def unexecute
    @hero.wood -= 10
  end
end

class HealthCommand
  def initialize(hero)
    @hero = hero
  end

  def execute
    @hero.health += 5
  end

  def unexecute
    @hero.health -= 5
  end
end

class MoneyCommand
  def initialize(hero)
    @hero = hero
  end

  def execute
    @hero.money += 10
  end

  def unexecute
    @hero.money -= 10
  end
end

class Reactor
  def initialize
    @functional = false
    @right_command = %Q{
AmplifyCommand
CalibrateDriverCommand
TestComplierCommand
InstallRegulatorCommand
}
  end

  def fix(result)
    @functional = result == @right_command
  end

  def functional?
    @functional
  end
end

class Computer
  attr_reader :queue

  def initialize
    @queue= []
  end

  def add(command)
    @queue << command
  end

  def execute
    queue.inject("\n") { |sum, command| sum + command.execute + "\n" }
  end
end

class AmplifyCommand
  def execute
    "AmplifyCommand"
  end
end

class CalibrateDriverCommand
  def execute
    "CalibrateDriverCommand"
  end
end

class TestComplierCommand
  def execute
    "TestComplierCommand"
  end
end

class InstallRegulatorCommand
  def execute
    "InstallRegulatorCommand"
  end
end