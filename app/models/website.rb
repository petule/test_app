class Website < ApplicationRecord
  before_save { url.downcase! }
  after_save :set_geo_locations
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

  scope :by_created_desc, -> { order('created_at desc') }

  def location_info
    "#{city} #{country}"
  end

  def set_geo_locations
    begin
      geo = GeoIP.new(Rails.root.join('geolite/GeoLiteCity.dat')).country(self.url.remove('https://').remove('/'))
      self.ip = geo[:ip]
      self.city = geo[:city_name]
      self.country = geo[:country_name]
      save
    rescue Exception => e
      puts e.inspect
    end
  end
end
