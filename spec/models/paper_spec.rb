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
    invalid_paper4 = Paper.new({"title" => "test", "venue" => "test", "year" => "test"})

    expect(invalid_paper1).to_not be_valid
    expect(invalid_paper2).to_not be_valid
    expect(invalid_paper3).to_not be_valid
    expect(invalid_paper4).to_not be_valid
  end

  it "should provide an 'authors' method returning all authors of the paper" do
    expect(@paper.authors).to_not be_nil

    alan = FactoryBot.create :author
    @paper.authors.append(alan)

    expect(alan.papers.include? @paper).to be true
  end
end
