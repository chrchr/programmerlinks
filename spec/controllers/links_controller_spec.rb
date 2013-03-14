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
    it "assigns the requested link as @link" do
      link = create(:link)
      get :show, {:id => link.to_param}
      expect(assigns(:link)).to eq link
    end

    it "renders to the show template" do
      get :show, {:id => create(:link)}
      expect(response).to render_template :show
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
    describe "with valid params" do
      it "creates a new Link" do
        expect {
          post :create, {:link => FactoryGirl.attributes_for(:link)}
        }.to change(Link, :count).by(1)
      end

      it "redirects to the index" do
        post :create, link: FactoryGirl.attributes_for(:link)
        expect(response).to redirect_to root_url
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved link as @link" do
        post :create, link: FactoryGirl.attributes_for(:invalid_link)
        expect(assigns(:link)).to be_a_new(Link)
      end

      it "re-renders the 'new' template" do
        post :create, link: FactoryGirl.attributes_for(:invalid_link)
        expect(response).to render_template "new"
      end
    end
  end
end
