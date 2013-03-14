require 'spec_helper'

describe Link do
  it "is valid with a name, url, and username" do
    expect(create(:link)).to be_valid
  end
  
  it "is invalid without a name" do
    expect(build(:link, name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid without a url" do
    expect(build(:link, url: nil)).to have(1).errors_on(:url)
  end

  it "is invalid without a username" do
    expect(build(:link, username: nil)).to have(1).errors_on(:username)
  end

  it "defaults to zero points" do
    expect(build(:link).points).to eq 0
  end

  it "gains a point when it is upvoted" do
    link = build(:link)
    link.upvote
    expect(link.points).to eq 1
  end
end
