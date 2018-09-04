class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
 
  has_many :collaborators
  has_many :wikis, dependent: :destroy, through: :collaborators

  after_initialize :default_user_role

  enum role: [:member, :premium, :admin]


#DEFAULT USER ROLE
  def default_user_role
    self.role ||= :member
  end

end
