require "spec_helper"

feature "Posting Comments" do
  before :each do
    @link = create(:link)
  end
  scenario "User submits a new comment on a link" do
    visit root_path
    click_link "0 comments"
    expect(current_path).to eq link_path(@link.id)
    fill_in :comment_comment, with: "This is the body of the comment"
    fill_in :comment_username, with: "A. User"
    click_button "add comment"
    expect(current_path).to eq link_path(@link.id)
    expect(page).to have_content "This is the body of the comment"
    visit root_path
    expect(page).to have_content "1 comment"
  end
end

