class PersonalWork < ApplicationRecord
  # Active Storage
  has_one_attached :image

  validates :image, presence: true, content_type: ['image/png', 'image/jpeg', 'image/jpg', 'image/gif']
  validates :title, presence: true

  default_scope { order(position: :asc, created_at: :desc) }

  before_create :set_defaults

  def image_url
    if image.attached?
      Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true)
    else
      super
    end
  end

  private

  def set_defaults
    self.title ||= 'nick nightin'
    self.email ||= About.first&.email || 'nicknightin@gmail.com'
    self.position ||= PersonalWork.maximum(:position).to_i + 1
  end
end