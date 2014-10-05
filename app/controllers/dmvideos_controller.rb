class DmvideosController < ApplicationController
  before_action :set_dmvideo, only: [:show, :destroy]

  # GET /dmvideos
  # GET /dmvideos.json
  def index
    @dmvideos = Dmvideo.all
  end

  # GET /dmvideos/1
  # GET /dmvideos/1.json
   def create
    @dmvideo = current_user.dmvideos.new(dmvideo_params)
    
    if @dmvideo.save
      respond_to do |format|
        format.html {  
          redirect_to @dmvideo, notice: '视频上传成功'
        }
        format.json {  
          render :json => @dmvideo         
        }
      end
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end
  
  def show
    @user = User.where("id = ?", @dmvideo.user_id.to_i).last
    @dmvideo.score.viewer.increment unless @user == current_user
  end

  # GET /dmvideos/new
  def new
    @dmvideo = current_user.dmvideos.new
  end

  # GET /dmvideos/1/edit
   def edit
    @dmvideo = Dmvideo.find(params[:id])
  end

  # POST /dmvideos
  # POST /dmvideos.json

  # PATCH/PUT /dmvideos/1
  # PATCH/PUT /dmvideos/1.json
  def update
    respond_to do |format|
      if @dmvideo.update(dmvideo_params)
        format.html { redirect_to @dmvideo, notice: 'Dmvideo was successfully updated.' }
        format.json { render :show, status: :ok, location: @dmvideo }
      else
        format.html { render :edit }
        format.json { render json: @dmvideo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dmvideos/1
  # DELETE /dmvideos/1.json
  def destroy
    @dmvideo.destroy
    respond_to do |format|
      format.html { redirect_to dmvideos_url, notice: 'Dmvideo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_dmvideo
    @dmvideo = Dmvideo.find(params[:id])
    @element = @dmvideo
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dmvideo_params
      params.require(:dmvideo).permit(:title, :user_id, :tudouid,:des,:cover)
    end
end
