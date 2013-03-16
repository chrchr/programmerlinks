require 'spec_helper'

describe CommentsController do

  describe "POST create" do
    let(:link) { create(:link) }
    let(:valid_comment_attributes) { FactoryGirl.attributes_for(:comment) }

    describe "with valid params" do

      it "creates a new Comment linked to a Link" do
        expect {
          post :create, link_id: link.id,
            comment: valid_comment_attributes
        }.to change(link.comments, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, link_id: link,
          comment: valid_comment_attributes
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end

      it "redirects to the index" do
        post :create, link_id: link, comment: valid_comment_attributes
        expect(response).to redirect_to link_url(link)
      end
    end

    describe "if the user somehow gets to this page without a valid link_id" do
      it "redirects to the root" do
        post :create, link_id: "invalid id", comment: valid_comment_attributes
        expect(response).to redirect_to root_url
      end
    end

    describe "with invalid params" do
      before :each do 
        Comment.any_instance.stub(:save).and_return(false)
      end

      it "assigns a newly created but unsaved comment as @comment" do
        post :create, link_id: link, comment: {}
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it "re-renders the link page" do
        post :create, link_id: link, comment: {}
        expect(response).to redirect_to link_url(link)
      end
    end
  end

end
