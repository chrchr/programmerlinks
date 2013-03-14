require "spec_helper"

feature "Posting Links" do
  scenario "User submit a new link" do
    visit root_url
    click_link "submit"
    expect(current_path).to eq new_link_path
    fill_in :link_name, exact: true, with: "An example link"
    fill_in "url", with: "http://example.com"
    fill_in "username", with: "A. User"
    click_button "submit"
    expect(current_path).to eq root_path
    expect(page).to have_content "1. An example link"
    expect(page).to have_content "by A. User"
    expect(find_link('An example link')[:href]).to eq 'http://example.com'
  end
end

