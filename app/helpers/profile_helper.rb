module ProfileHelper
  def current_user_profile_detail_url
    "/profile/#{current_user.id}/detail"
  end
end
