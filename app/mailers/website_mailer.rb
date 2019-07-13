class WebsiteMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def url_info(website)
    @website = website
    mail(to: website.email, subject: 'Website info')
  end
end
