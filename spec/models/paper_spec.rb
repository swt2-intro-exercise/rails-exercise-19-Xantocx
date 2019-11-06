require 'rails_helper'

RSpec.describe Paper, type: :model do
  
  before(:each) do
    @paper = FactoryBot.create :paper
  end

  it "should be invalid to create a paper with no title" do
    expect(@paper).to be_valid

    invalid_paper1 = Paper.new({"title" => nil, "venue" => "test", "year" => 0})
    invalid_paper2 = Paper.new({"title" => "test", "venue" => nil, "year" => 0})
    invalid_paper3 = Paper.new({"title" => "test", "venue" => "test", "year" => nil})

    expect(invalid_paper1).to_not be_valid
    expect(invalid_paper2).to_not be_valid
    expect(invalid_paper3).to_not be_valid
  end
end
