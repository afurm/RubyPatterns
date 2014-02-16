require 'spec_helper'
require_relative '../lib/sigleton.rb'

describe 'Sigleton Pattern' do
  let (:factory) { HeroSingleton.instance }

  it 'returns instance of HeroFactory' do
    expect(factory).to be_an_instance_of(HeroFactory)
  end

  it 'is the same object even we create another one' do
    another_factory = HeroSingleton.instance
    expect(another_factory).to eq(factory)
  end

  it 'has no access to new method' do
    expect { HeroSingleton.new }.to raise_exception
  end
end