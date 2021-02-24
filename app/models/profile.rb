class Profile < ApplicationRecord
  # Associations
  belongs_to :user

  # Validations
  validates :address_line, :street, :city, :state, :pincode, :country, presence: true
end
