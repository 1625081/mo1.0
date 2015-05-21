class SubimagesController < ApplicationController
  def create
    # @class = "#{$element.class}".downcase
    if params[:image_id]
      @element = Image.find(params[:image_id])
      @comment = @element.subimages.create(comment_params)
      redirect_to edit_image_path(@element)
    end
  end
  
  def destroy
    if params[:music_id]
      @element = Music.find(params[:music_id])
      @comment = @element.comments.find(params[:id])
      @comment.destroy
      redirect_to music_path(@element)
    end
    if params[:video_id]
      @element = Video.find(params[:video_id])
      @comment = @element.comments.find(params[:id])
      @comment.destroy
      redirect_to video_path(@element)
    end
    if params[:article_id]
      @element = Article.find(params[:article_id])
      @comment = @element.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@element)
    end
  end
  private
    def subimage_params
      params.require(:subimage).permit(:file)
    end
end
