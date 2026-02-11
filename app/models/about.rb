class About < ApplicationRecord
  # Active Storage
  has_one_attached :image

  validates :email, presence: true
  validates :description, presence: true

  def self.singleton
    first_or_create(
      description: 'Character designer with a passion for creating unique and memorable characters. I specialize in developing visual identities for animation, games, and illustrated stories.',
      email: 'nicknightin@gmail.com'
    )
  end

  def image_url
    if image.attached?
      Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true)
    else
      super || 'https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'
    end
  end
end