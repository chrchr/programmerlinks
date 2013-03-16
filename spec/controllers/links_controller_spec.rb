require 'spec_helper'

describe LinksController do

  describe "GET index" do
    it "assigns all links as @links" do
      link = create(:link)
      get :index
      expect(assigns(:links)).to match_array [link]
    end

    it "renders to the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET show" do
    subject do
      create(:link)
    end

    it "assigns the requested link as @link" do
      get :show, id: subject.to_param
      expect(assigns(:link)).to eq subject
    end

    it "renders to the show template" do
      get :show, id: subject
      expect(response).to render_template :show
    end

    it "assings a new @comment for the comments form on the page" do
      get :show, id: subject
      expect(assigns(:comment)).to be_a_new Comment
    end
  end


  describe "GET new" do
    it "assigns a new link as @link" do
      get :new
      expect(assigns(:link)).to be_a_new Link
    end
    it "renders to the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    let(:link_attributes) { FactoryGirl.attributes_for(:link) }
    describe "with valid params" do
      it "creates a new Link" do
        expect {
          post :create, {:link => link_attributes}
        }.to change(Link, :count).by(1)
      end

      it "redirects to the index" do
        post :create, link: link_attributes
        expect(response).to redirect_to root_url
      end

      it "defaults to zero points" do
        post :create, link: link_attributes
        expect(Link.where(url: link_attributes[:url]).first.points).to eq 0
      end
    end

    describe "with invalid params" do
      let(:invalid_link) { FactoryGirl.attributes_for(:invalid_link) }
      it "assigns a newly created but unsaved link as @link" do
        post :create, link: invalid_link
        expect(assigns(:link)).to be_a_new(Link)
      end

      it "re-renders the 'new' template" do
        post :create, link: invalid_link
        expect(response).to render_template "new"
      end
    end
  end

  describe "POST upvote" do
    let(:link) { create(:link) }
    it "increments the points" do
      post :upvote, id: link.to_param
      expect(link.reload.points).to eq 1
    end

    it "renders the upvote partial" do
      post :upvote, id: link
      expect(response).to render_template "upvote"
    end
  end
end
