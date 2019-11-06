require 'rails_helper'

RSpec.describe "Authors index page", type: :feature do
  
    before(:each) do
        @alan = FactoryBot.create :author
    end

    it "should have a table displaying the name and the homepage of all authors" do
        visit authors_path

        expect(page).to have_table("index_table")

        table = find("table")

        expect(table).to have_text("Name")
        expect(table).to have_text("Homepage")
        expect(table).to have_text(@alan.name)
        expect(table).to have_text(@alan.homepage)
    end

    it "should display a show, edit and delete button for all authors" do
        visit authors_path

        table = find("table")

        expect(table).to have_link "Show", href: author_path(@alan)
        expect(table).to have_link "Edit", href: edit_author_path(@alan)
        expect(table).to have_link "Delete", href: author_path(@alan)
    end

    it "should display a button 'New' to create a new author" do
        visit authors_path

        expect(page).to have_link "New", href: new_author_path
    end

    it "should decrease the authors count when an author is deleted" do
        visit authors_path

        start_count = Author.count

        find_link("Delete").click

        expect(Author.count).to be < start_count
    end
end
