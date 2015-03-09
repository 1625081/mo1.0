class Api::V1::ScoreController < Api::V1::BaseController
  respond_to :json
  before_action :check_secret, except: :get_score
  before_action :set_score

  def get_score
    @score.score = @score.generate_score
    json = {
      likes: @score.liker.size,
      favor: @score.favor.size,
      viewers: @score.viewer.value,
      score: @score.score
    }
    render json: json
  end

  def like
    @score.liker += [user_params.to_i]
    @owner = User.where('id=?', [user_params.to_i] ).last
    @score.liker.uniq!
    @score.score = @score.generate_score
    if @score.save
      render json: {status: 200}
    else
      raise UnknowError
    end
  end

  def favor
    @score.favor += [user_params.to_i]
    @score.favor.uniq!
    @score.score = @score.generate_score
    if @score.save
      render json: {status: 200}
    else
      raise UnknowError
    end
  end

  def unlike
    @score.liker -= [user_params.to_i]
    @score.liker.uniq!
    @score.score = @score.generate_score
    if @score.save
      render json: {status: 200}
    else
      raise UnknowError
    end
  end

  def unfavor
    @score.favor -= [user_params.to_i]
    @score.favor.uniq!
    @score.score = @score.generate_score
    if @score.save
      render json: {status: 200}
    else
      raise UnknowError
    end
  end

  private
  def check_secret
    @secret = Digest::MD5.hexdigest(Digest::SHA1.hexdigest(Base64::encode64(Rails.application.secrets.angular_secret)))
    unless params[:secret] == @secret
      raise NoPolicyError
    end
  end

  def set_score
    @score = Score.where('id = ?', info_params).last
    unless @score
      raise WrongParamsError
    end
  end

  def user_params
    params[:user]
  end

  def info_params
    params[:id]
  end
end