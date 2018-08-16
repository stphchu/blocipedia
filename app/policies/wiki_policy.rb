class WikiPolicy < ApplicationPolicy

#DESTROY
  def destroy?
    user.role == 'admin'
  end

end
