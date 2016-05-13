require 'spec_helper'

describe 'Armor' do
  before do
    @test_armor = Armor.new('FullPlate', 9, 1, -6, 0.65)
  end

  it 'has a rating' do
    expect(@test_armor.rating).to eq(4)
  end

  it 'has an arcane rating' do
    expect(@test_armor.arcane_rating).to eq(2.6)
  end
end