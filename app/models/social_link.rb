class SocialLink < ApplicationRecord
  validates :platform, presence: true, uniqueness: true
  validates :url, presence: true
  validates :icon, presence: true
  validates :label, presence: true

  default_scope { order(position: :asc, platform: :asc) }

  PLATFORMS = [
    { platform: 'behance', icon: 'fab fa-behance', label: 'Behance' },
    { platform: 'instagram', icon: 'fab fa-instagram', label: 'Instagram' },
    { platform: 'linkedin', icon: 'fab fa-linkedin', label: 'LinkedIn' },
    { platform: 'twitter', icon: 'fab fa-twitter', label: 'Twitter' }
  ]

  def self.seed_defaults
    PLATFORMS.each_with_index do |p, index|
      find_or_create_by(platform: p[:platform]) do |link|
        link.url = "https://#{p[:platform]}.com/nicknightin"
        link.icon = p[:icon]
        link.label = p[:label]
        link.position = index
      end
    end
  end
end