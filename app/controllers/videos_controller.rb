class VideosController < ApplicationController
  before_action :set_video, only: [:show, :destroy]

  def new
    @video = current_user.videos.new
  end

  def index
    @videos = Video.all
  end 

  def upload_to_youku
  end

  def create
    @video = current_user.videos.new(video_params)
    
    if @video.save
      respond_to do |format|
        format.html {  
          redirect_to @video, notice: '视频上传成功'
        }
        format.json {  
          render :json => @video         
        }
      end
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def show
     @user = User.where("id = ?", @video.user_id.to_i).last
    @video.score.viewer.increment unless @user == current_user
  end

  def destroy
    @video.destroy
    respond_to do |format|
      #format.html { redirect_to musics_url, notice: 'Music was successfully destroyed.' }
      format.json json: true
    end
  end

  def upload
  end 

  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  private
  def set_video
    @video = Video.find(params[:id])
    @element = @video
  end

  def video_params
    params.require(:video).permit(:title,:youkuid,:des,:user_id,:cover)
  end
end