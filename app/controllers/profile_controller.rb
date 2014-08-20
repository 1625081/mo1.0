class ProfileController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update]
  before_action CASClient::Frameworks::Rails::Filter, only: :verify_identity
  def index
    @user = current_user
    @items = []
    @items += @user.images.all
    @items.sort_by {|i| i.created_at}
  end

  def verify_identity
    @user = User.where('id = ?', require_to_verify).last
    if @user
      if session[:cas_user]
        @user.pku_id = session[:cas_user]
        if @user.save
          redirect_to edit_user_registration_path, info: '用户认证成功！'
        else
          raise UnknownError
        end
      else
        raise UnableToVerify
      end
    else
      raise WrongParamError
    end
  end

  def edit
    @user = current_user
  	@profile = current_user.profile
  end

  def show
  	@user = User.find(params[:id])
    @user.viewer.increment unless @user == current_user
  end

  def detail
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  def follow
  end


  # PATCH/PUT /profiles
  # PATCH/PUT /profiles.json
  def update
    @profile = current_user.profile
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: '资料更新成功！' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', warning: '资料更新时发生错误，请重试！' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:avatar, :nickname, :description, :birthday, :sex)
    end

    def require_to_verify
      Base64::decode64 params[:user_id]
    end
end
