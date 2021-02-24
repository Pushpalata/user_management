class Profile < ApplicationRecord
  # Associations
  belongs_to :user

  has_one_attached :display_picture

  # Validations
  validates :name, :address_line, :street, :city, :state, :pincode, :country, presence: true
  validates :phone_number, numericality: true,
                    length: { minimum: 10, maximum: 15 }, allow_blank: true
  validates :pincode, format: { with: /([1-9]{1}[0-9]{5}|[1-9]{1}[0-9]{3}\\s[0-9]{3})/ }, allow_blank: true
  validates :name, :city, :state, :country, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/ }, allow_blank: true
  validate :validate_display_picture

  # scope
  scope :latest, -> { order(updated_at: :desc) }
  scope :except_self, -> (user_id) { where('user_id != ?', user_id) }

  
  def validate_display_picture
    return unless display_picture.attached?
  
    unless ["image/jpeg", "image/png"].include?(display_picture.content_type)
      errors.add(:display_picture, "must be a JPEG or PNG")
    end
  end
  
end
