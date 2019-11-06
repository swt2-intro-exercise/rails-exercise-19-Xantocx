require 'rails_helper'

RSpec.describe "paper index page", type: :feature do
  
    before(:each) do
        @paper = FactoryBot.create :paper
    end

    it "should have a table displaying the title and the year of all papers" do
        visit papers_path

        expect(page).to have_table("index_table")

        table = find("table")

        expect(table).to have_text("Title")
        expect(table).to have_text("Year")
        expect(table).to have_text(@paper.title)
        expect(table).to have_text(@paper.year)
    end

    it "should display a show, edit and delete button for all papers" do
        visit papers_path

        table = find("table")

        expect(table).to have_link "Show", href: paper_path(@paper)
        expect(table).to have_link "Edit", href: edit_paper_path(@paper)
        expect(table).to have_link "Delete", href: paper_path(@paper)
    end

    it "should display a button 'New' to create a new paper" do
        visit papers_path

        expect(page).to have_link "New", href: new_paper_path
    end

    it "should decrease the authors count when an author is deleted" do
        visit papers_path

        start_count = Paper.count

        find_link("Delete").click

        expect(Paper.count).to be < start_count
    end
end
