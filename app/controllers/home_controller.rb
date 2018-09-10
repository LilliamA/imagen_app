class HomeController < ApplicationController
  def index
    @images = Image.where private_img: true
  end
end
