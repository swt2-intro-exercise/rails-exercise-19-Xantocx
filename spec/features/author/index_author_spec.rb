require 'rails_helper'

RSpec.describe "authors/index.html.erb", type: :feature do
  
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
        expect(table).to have_link "Show", href: author_path(@alan)

        expect(page).to have_link "New", href: new_author_path
    end
end
