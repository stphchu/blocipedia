class UsersController < ApplicationController

  def downgrade_account
      current_user.member!
    
      flash[:notice] = "Your account has now been downgraded."
      redirect_to edit_user_registration_path
  end

end
