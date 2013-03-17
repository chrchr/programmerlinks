require "spec_helper"

feature "Voting on links" do
  before :each do
    @link = create(:link)
  end
  scenario "Increments the link's points", js: true do
    visit root_path
    expect(current_path).to eq root_path
    expect(page).to have_content("0 points by")
    find("#upvote_%d" % @link.id).click
    expect(current_path).to eq root_path
    expect(page).to have_content("1 point by")
    find("#upvote_%d" % @link.id).click
    expect(page).to have_content("2 points by")
  end
end

