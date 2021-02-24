class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user, :admin]
  validates :name, presence: true

  # Associations
  has_one :profile, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :profile

  def with_profile
    build_profile if profile.nil?
  end
end
