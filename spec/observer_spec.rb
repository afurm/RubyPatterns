require 'spec_helper'
require_relative '../lib/observer_pattern.rb'

describe 'Observer Pattern' do
  describe HeroOb do
    let(:hero) { HeroOb.new }

    it 'is cursed when discovers cursed Tile' do
      tile = Tile.new cursed: true
      hero.discover(tile)

      expect(hero.cursed?).to be_true
    end

    it 'is not cursed when discovers simple Tile' do
      tile = Tile.new
      hero.discover(tile)

      expect(hero.cursed?).to be_false
    end

    it 'has default health' do
      expect(hero.health).to eq(10)
    end

    it 'has default health' do
      hero.damage(6)
      expect(hero.health).to eq(4)
    end
  end

  describe Tile do
    it 'activates curse' do
      hero = HeroOb.new
      tile = Tile.new cursed: true
      hero.discover(tile)


      tile.activate_curse
      expect(hero.health).to eq(6)
    end

    it 'activates curse on several heroes' do
      hero1 = HeroOb.new
      hero2 = HeroOb.new
      tile = Tile.new cursed: true
      hero1.discover(tile)
      hero2.discover(tile)

      tile.activate_curse
      expect(hero1.health).to eq(6)
      expect(hero2.health).to eq(6)
    end

    it 'is not cursed by default' do
      tile = Tile.new
      expect(tile.cursed?).to be_false
    end

    it 'can be created as cursed' do
      tile = Tile.new cursed:true
      expect(tile.cursed?).to be_true
    end
  end
end
