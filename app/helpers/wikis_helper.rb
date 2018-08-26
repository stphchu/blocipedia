module WikisHelper

  def user_authorized_for_private?
     current_user.admin? || current_user.premium?
  end

end
