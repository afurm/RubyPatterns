require 'spec_helper'
require_relative '../lib/template_method.rb'

describe 'Template Method Pattern' do

  context 'Default Hero' do
    let(:hero) { HeroTemplate.new }
    it 'has default damage rating of 10' do
      expect(hero.damage).to eq(10)
    end

    it 'can attack' do
      expect(hero.attack).to eq("Attacked dealing 10 damage")
    end

    it 'requires subclasses to implement uniq_greeting_line' do
      expect{hero.greet}.to raise_exception
    end
  end

  context 'Warrior' do
    let(:hero) { Warrior.new }
    it 'has default damage rating of 15' do
      expect(hero.damage).to eq(15)
    end

    it 'has Strike ability' do
      expect(hero.abilities).to include(:strike)
    end

    it 'greets other character' do
      expect(hero.greet).to eq(["Hello", "Warrior is ready to fight"])
    end
  end

  context 'Mage' do
    let(:hero) { Mage.new }
    it 'has default damage rating of 7' do
      expect(hero.damage).to eq(7)
    end

    it 'has Mage ability' do
      expect(hero.abilities).to include(:magic_arrow)
    end
    it 'greets other character' do
      expect(hero.greet).to eq(["Hello", "Mage is ready to fight"])
    end
  end
end