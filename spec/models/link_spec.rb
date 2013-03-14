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
end
