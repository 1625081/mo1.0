class VideosController < ApplicationController

def new

end

def index
	@videos = Video.all
end	

def create
@video = Video.new(video_params)
@video.save
redirect_to @video
end

def show
	@video = Video.find(params[:id])

end	
def destroy
  @video = Video.find(params[:id])
  @video.destroy
 
  redirect_to videos_path
end
private
  def video_params
    params.require(:video).permit(:title,:owner,:youkuid)
  end

end
