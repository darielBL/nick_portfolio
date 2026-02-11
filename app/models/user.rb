class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  before_create :set_defaults

  private

  def set_defaults
    self.name ||= 'NICK NIGHTIN'
    self.title ||= 'character designer'
  end
end