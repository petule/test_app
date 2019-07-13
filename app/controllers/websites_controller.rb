class WebsitesController < ApplicationController

  # GET /websites
  # GET /websites.json
  def index
    @websites = Website.all.by_created_desc
  end

  # GET /websites/new
  def new
    @website = Website.new
  end

  # POST /websites
  # POST /websites.json
  def create
    @website = Website.new(website_params)

    respond_to do |format|
      if @website.save
        WebsiteMailer.url_info(@website).deliver_later
        format.html { redirect_to websites_path, notice: 'Website was successfully created.' }
        format.json { render :show, status: :created, location: @website }
      else
        format.html { render :new }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def website_params
    params.require(:website).permit(:url, :email).merge({ ip: request.remote_ip })
  end
end
