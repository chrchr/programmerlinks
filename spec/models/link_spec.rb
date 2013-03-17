require 'spec_helper'

describe Link do

  let(:link) { create(:link) }

  describe "valid link" do
    subject { link }

    it "is valid with a name, url, and username" do
      should be_valid
    end
  end
  
  describe "invalid links" do
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

  describe "points" do
    subject { link.points }
    it "defaults to zero points" do
      should eq 0
    end

    it "gains a point when it is upvoted" do
      link.upvote
      should eq 1
    end
  end

  describe "domain" do
    subject { link.domain }
    it "gives the domain of the url" do
      should eq "example.com"
    end
  end
end
