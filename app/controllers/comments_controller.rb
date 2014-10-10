class CommentsController < ApplicationController
  def create
    @music = Music.find(params[:music_id])
    @comment = @music.comments.create(comment_params)
    redirect_to music_path(@music)
  end
  def destroy
    @music = Music.find(params[:music_id])
    @comment = @music.comments.find(params[:id])
    @comment.destroy
    redirect_to music_path(@music)
  end
  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
