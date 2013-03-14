class LinksController < ApplicationController
  # GET /links
  def index
    @links = Link.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /links/1
  def show
    @link = Link.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /links/new
  def new
    @link = Link.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /links
  def create
    @link = Link.new(params[:link])

    respond_to do |format|
      if @link.save
        format.html { redirect_to root_url, notice: 'Link was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  # POST /links/1/upvote
  def upvote
    @link = Link.find(params[:id])
    @link.upvote
    if @link.save
      respond_to do |format|
        format.html { render partial: "upvote", object: @link }
      end
    end
  end
end
