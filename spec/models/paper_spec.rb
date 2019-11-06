require 'rails_helper'

RSpec.describe Paper, type: :model do
  
  before(:each) do
    @paper = FactoryBot.create :paper
  end

  it "should be invalid to create a paper with no title" do
    expect(@paper).to be_valid

    invalid_paper = Paper.new({"title" => nil, "venue" => "", "year" => 0})

    expect(invalid_paper).to_not be_valid
  end
end
