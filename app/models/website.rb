class Website < ApplicationRecord
  
  before_save { weburl.downcase! }

  # standard validation
  validates :weburl, url: true

  # with allow_nil
  validates :weburl, url: { allow_nil: true }

  # with allow_blank
  validates :weburl, url: { allow_blank: true }

  # without local hostnames
  validates :weburl, url: { no_local: true }

  # with custom schemes
  validates :weburl, url: { schemes: ['https'] }

  # with public suffix database https://publicsuffix.org/
  validates :weburl, url: { public_suffix: true }

  validates :weburl, presence: true, length: { maximum: 255 },
                     uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true, length: { maximum: 180 },
                    format:     { with: VALID_EMAIL_REGEX }
end
