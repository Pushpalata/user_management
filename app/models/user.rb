class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user, :admin]

  # Associations
  has_one :profile, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :profile

  def with_profile
    build_profile if profile.nil?
  end

  def admin_own_profile?(user_id)
    self.admin? && self.own_profile?(user_id)
  end

  def own_profile?(user_id)
    user_id == self.id
  end
  
end
