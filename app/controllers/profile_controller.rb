class ProfileController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update]

  def index
    @user = current_user
  end

  def edit
    @user = current_user
  	@profile = current_user.profile
  end

  def show
  	@user = User.find(params[:id])
    @user.viewer.increment
  end

  def detail
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  # PATCH/PUT /profiles
  # PATCH/PUT /profiles.json
  def update
    @profile = current_user.profile
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:avatar, :nickname, :description, :birthday, :sex)
    end
end
