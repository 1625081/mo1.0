require 'digest'
require 'base64'
require 'qiniu'
class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
    render :json => @images.collect { |p| p.to_jq_upload }.to_json
  end

  # GET /images/1
  # GET /images/1.json
  
  def show
    @secret = Digest::MD5.hexdigest(Digest::SHA1.hexdigest(Base64::encode64(Rails.application.secrets.angular_secret)))
    @user = User.where("id = ?", @image.user_id.to_i).last
    @element = @image
    @image.score.viewer.increment unless @user == current_user
  end

  # GET /images/new
  def new
    @image = current_user.images.new
    @image.save
  end

  # GET /images/1/edit
  def edit
    
  end

  # POST /images
  # POST /images.json
  def create
    Image.all.each do |image|
      if image.keys == []
        image.delete
        image.save
      end
    end
   respond_to do |format|
     if @image
      @image.save
      format.html { redirect_to @image, notice: '照片流成功上传到七牛云相册！'}
     else
      format.html { redirect_to new_image_path, notice: '照片流上传失败，请重试！'}
     end
   end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    Image.all.each do |image|
      if image.keys == []
        image.delete
        image.save
      end
    end
   respond_to do |format|
     if @image
      @image.update(image_params)#这里必须给出“image_params”
      format.html { redirect_to @image, notice: '照片流成功上传到七牛云相册！'}
     else
      format.html { redirect_to new_image_path, notice: '照片流上传失败，请重试！'}
     end
   end
  end

  # POST /images/qiniu/callback
  def qiniu_callback
    begin
      @image = Image.where("id = ?",params[:custom_fields][:iid].to_i).last#利用之前的item id
      @fixed_key = params[:key]
      @image.keys += [@fixed_key] #Ruby语法！数组只能与数组相加！
      if @image.save
        render :json => {:success => true}#在浏览器console里可以看见结果
      else
        raise Exception
      end
    rescue  Exception => e #意外处理
      render :json => {:success => false, :message => "上传失败!?"}
    end
  end


  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      #format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json json: true
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
      @element = @image
      @secret = Digest::MD5.hexdigest(Digest::SHA1.hexdigest(Base64::encode64(Rails.application.secrets.angular_secret)))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params #实现图片交互信息的重要方法，其中每一个参数都是神奇的
      params.require(:image).permit(:public, :title, :description, :exif)
    end

    def upload_image_params
      params[:image].permit(:file)
    end
end
