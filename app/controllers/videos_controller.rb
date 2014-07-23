class VideosController < ApplicationController

def new

end

def create
@video = Video.new(video_params)
@video.save
redirect_to @video
end

def show
	@video = Video.find(params[:id])

end	

private
  def video_params
    params.require(:video).permit(:title,:owner,:youkuid)
  end

end
