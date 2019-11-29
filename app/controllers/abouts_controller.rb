class AboutsController < ApplicationController
  require 'presenters/about_us'

  def index
    @abouts = Presenters::AboutUs.new
  end
end
