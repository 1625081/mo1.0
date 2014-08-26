class Api::V1::UploadController < Api::V1::BaseController
  #before_action :check_secret

  def image
    @image = Thumb.new
    @image.file = file_params
    if @image.save
      render json: { file_path: @image.file.url }
    end
  end

  private
  #def check_secret
  #  begin
  #    unless params[:secret] == Rails.application.secrets.upload
   #     raise NoPoliceToUpload
   #   end
   # rescue NoPoliceToUpload
   #   render json: {error: "You have no police to upload files."}
   # end
  #end

  def file_params
    params[:upload_file]
  end
end