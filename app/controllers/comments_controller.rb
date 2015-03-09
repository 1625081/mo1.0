class CommentsController < ApplicationController
  def create
    @class = "#{$element.class}".downcase
    @comment = $element.comments.create(comment_params)
    redirect_to "/#{@class}" + 's' + "/#{$element.id}"
  end
  def destroy
    @class = "#{$element.class}".downcase
    @comment = $element.comments.find(params[:id])
    @comment.destroy
    redirect_to "/#{@class}" + 's' + "/#{$element.id}"
  end
  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
