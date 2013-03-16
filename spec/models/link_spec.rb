require 'spec_helper'

describe Link do
  describe "valid link" do
    subject { create(:link) }

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
    let(:link) { build(:link) }
    subject { link.points }
    it "defaults to zero points" do
      should eq 0
    end

    it "gains a point when it is upvoted" do
      link.upvote
      should eq 1
    end
  end
end
