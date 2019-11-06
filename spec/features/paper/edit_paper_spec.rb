require 'rails_helper'

describe "edit paper page", type: :feature do
  
    it "should render withour error" do
        visit new_paper_path
    end

    it "should have text inputs for an paper's title, venue and year" do
        visit new_paper_path
        
        expect(page).to have_field('paper[title]')
        expect(page).to have_field('paper[venue]')
        expect(page).to have_field('paper[year]')
      end
end