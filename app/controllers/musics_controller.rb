class MusicsController < ApplicationController
  before_action :set_music, only: [:show, :edit, :update, :destroy]

  # GET /musics
  # GET /musics.json
  def index
    @musics = Music.all
  end

  # GET /musics/1
  # GET /musics/1.json
  def show
    @user = User.where("id = ?", @music.user_id.to_i).last
    @music.score.viewer.increment unless @user == current_user
  end

  # GET /musics/new
  def new
    if current_user
      if current_user.power != "user"
        @music = current_user.musics.new
      else
        redirect_to home_path
      end 
    else
      redirect_to home_path
    end
  
  end

  # GET /musics/1/edit
  def edit
  end

  # POST /musics
  # POST /musics.json
  def create
    @music = current_user.musics.new(music_params)
    
    if @music.save
      respond_to do |format|
        format.html {  
          redirect_to @music, notice: '音频上传成功'
        }
        format.json {  
          render :json => @music           
        }
      end
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  # PATCH/PUT /musics/1
  # PATCH/PUT /musics/1.json
  def update
    respond_to do |format|
      if @music.update(music_params)
        format.html { redirect_to @music, notice: 'Music was successfully updated.' }
        format.json { render :show, status: :ok, location: @music }
      else
        format.html { render :edit }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musics/1
  # DELETE /musics/1.json
  def destroy
    @music.destroy
    respond_to do |format|
      format.html { redirect_to musics_url, notice: 'Music was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_music
      @music = Music.find(params[:id])
      $element = @music #隐患，用户不能同时对两个东西做评论，那样全局变量会错乱
      @element = @music 
      @secret = Digest::MD5.hexdigest(Digest::SHA1.hexdigest(Base64::encode64(Rails.application.secrets.angular_secret)))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def music_params
      params.require(:music).permit(:title, :user_id, :des, :file, :cover)
    end
end
