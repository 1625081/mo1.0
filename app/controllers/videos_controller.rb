class VideosController < ApplicationController
  before_action :set_video, only: [:show, :destroy]

  def new
  end

  def index
    @videos = Video.all
  end 

  def upload_to_youku
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to @video
    end
  end

  def show
  end

  def destroy
    if @video.destroy
      redirect_to videos_path
    end
  end

  def upload
  end 

  def update
  @video = Video.find(params[:id])
 
    if @video.update(video_params)
      redirect_to @video
    else
      render 'edit'
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  private
  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title,:user_id,:youkuid)
  end
end