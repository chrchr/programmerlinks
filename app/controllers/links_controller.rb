class LinksController < ApplicationController
  # GET /links
  def index
    @links = Link.all
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1
  def show
    @link = Link.find(params[:id])
    @page_title = @link.name
    @comment = Comment.new
  end

  # POST /links
  def create
    @link = Link.new(params[:link])

    if @link.save
      redirect_to root_url, notice: 'Link was successfully created.'
    else
      render action: "new"
    end
  end
  
  # POST /links/1/upvote
  def upvote
    @link = Link.find(params[:id])
    @link.upvote
    if @link.save
      render partial: "votes", object: @link
    end
  end
end
