require 'spec_helper'

describe Link do
  it "is valid with a name, url, and username" do
    link = Link.new(
      name: "An Example Link",
      url: "http://example.com",
      username: "R. Church")
    expect(link).to be_valid
  end
  
  it "is invalid without a name" do
    expect(Link.new(name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid without a url" do
    expect(Link.new(url: nil)).to have(1).errors_on(:url)
  end

  it "is invalid without a username" do
    expect(Link.new(username: nil)).to have(1).errors_on(:username)
  end
end
