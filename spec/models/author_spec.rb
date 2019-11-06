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

  it "should be validated that every author has a not-empty string as last name" do
    expect(@alan).to be_valid

    invalid_author1 = Author.new({"first_name" => "", "last_name" => "", "homepage" => ""})
    invalid_author2 = Author.new({"first_name" => nil, "last_name" => nil, "homepage" => nil})
    invalid_author3 = Author.new({"first_name" => "alan", "last_name" => nil, "homepage" => "http://example.com"})

    expect(invalid_author1).to_not be_valid
    expect(invalid_author2).to_not be_valid
    expect(invalid_author3).to_not be_valid
  end

  it "should provide an 'papers' method returning all papers of the author" do
    expect(@alan.papers).to_not be_nil

    paper = FactoryBot.create :paper
    @alan.papers.append(paper)
    
    expect(paper.authors.include? @alan).to be true
  end
end
