json.extract! website, :id, :url, :email, :created_at, :updated_at
json.url website_url(website, format: :json)
