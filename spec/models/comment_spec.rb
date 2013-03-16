require 'spec_helper'

describe Comment do
  describe "valid comment" do
    subject { create(:comment) }

    it "is valid with a link and a comment and a username" do
      should be_valid
    end
  end
  
  describe "invalid comment" do
    it "is invalid without a link" do
      expect(build(:comment, link: nil)).to have(1).errors_on(:link)
    end

    it "is invalid without a comment" do
      expect(build(:comment, comment: nil)).to have(1).errors_on(:comment)
    end

    it "is invalid without a username" do
      expect(build(:comment, username: nil)).to have(1).errors_on(:username)
    end
  end
end
