class Party
  attr_reader :members

  def initialize(factory)
    @members = []
    @factory = factory
  end

  def add_warrior(number)
    number.times { @members << @factory.create_warrior }
  end

  def add_mage(number)
    number.times { @members << @factory.create_mage }
  end
end

class HeroFactory
  def create_warrior
    Warrior.new
  end

  def create_mage
    Mage.new
  end
end

class PartyFactory < Party

  def create(occupation)
    if [:warrior, :mage].include? occupation
      self.class.const_get(occupation.to_s.capitalize).new
    else
      raise "Unknown hero type"
    end
  end

end

class HeroTemplate
  attr_reader :damage, :abilities

  def initialize
    @damage = damage_rating
    @abilities = occupation_abilities
  end

  def attack
    "Attacked dealing #{@damage} damage"
  end

  def greet
    greeting = ["Hello"]
    greeting << uniq_greeting_line
    greeting
  end

  def uniq_greeting_line
    raise "You must define uniq_greeting_line"
  end

  def damage_rating
    10
  end

  def occupation_abilities
    []
  end
end

class Warrior < HeroTemplate

  def damage_rating
    15
  end

  def occupation_abilities
    [:strike]
  end

  def uniq_greeting_line
    "Warrior is ready to fight"
  end
end

class Mage < HeroTemplate

  def damage_rating
    7
  end

  def occupation_abilities
    [:magic_arrow]
  end

  def uniq_greeting_line
    "Mage is ready to fight"
  end
end