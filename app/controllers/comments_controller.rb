class CommentsController < ApplicationController
  # POST /comments
  def create
    begin
      @comment = Comment.new(params[:comment])
      @comment.link = Link.find(params[:link_id])
      redirect_to link_url(@comment.link_id),
          notice: (@comment.save ? 
                   "Comment was successfully created." : "FAIL")
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url
    end
  end
end
