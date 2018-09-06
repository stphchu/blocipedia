class Collaborator < ApplicationRecord

  belongs_to :wiki
  belongs_to :user

  validates :user, uniqueness: { scope: :wiki }
  validate :user_is_not_owner
 

  private

  def user_is_not_owner
    return unless user == wiki.user
    errors.add(:user, "You are the owner of the page")
  end

end
