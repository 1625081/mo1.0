class Api::V1::TestController < Api::V1::BaseController
  def notice

  end

  def warning
  
  end

  private
  def content_params
    params[:content]
  end
end