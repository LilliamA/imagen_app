class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @images = Image.order(id: :desc).where private_img: true

  end
end
