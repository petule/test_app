class Website < ApplicationRecord
  
  before_save { url.downcase! }

  # standard validation
  validates :url, url: true

  # with custom schemes
  validates :url, url: { schemes: ['https'] }

  # with public suffix database https://publicsuffix.org/
  validates :url, url: { public_suffix: true }

  validates :url, presence: true, length: { maximum: 255 },
                     uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true, length: { maximum: 180 },
                    format:     { with: VALID_EMAIL_REGEX }
end
