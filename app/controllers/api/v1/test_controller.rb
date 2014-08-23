class Api::V1::TestController < Api::V1::BaseController
  def notice
    respond_to do |f|
      f.html { notice: content_params }
    end
  end

  def warning
    respond_to do |f|
      f.html { warning: content_params }
    end
  end

  private
  def content_params
    params[:content]
  end
end