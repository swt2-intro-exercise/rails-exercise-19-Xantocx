require 'rails_helper'

RSpec.describe Author, type: :model do
  
  before(:each) do
    @alan_name = 'Alan Turing'
    @alan_first_name = 'Alan'
    @alan_last_name = 'Turing'
    @alan_homepage = 'http://wikipedia.de/Alan_Turing'

    @alan = FactoryBot.create :author
  end

  it "should create instances that correctly store the given information" do
    expect(@alan.first_name).to eq(@alan_first_name)
    expect(@alan.last_name).to eq(@alan_last_name)
    expect(@alan.homepage).to eq(@alan_homepage)
  end

  it "should return the whole name when name is called" do
    expect(@alan.name).to eq(@alan_name)
  end
end
