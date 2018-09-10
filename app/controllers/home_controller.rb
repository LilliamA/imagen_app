class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @images = Image
                  .paginate( page: params[:page] , per_page: 3)
                  .order(id: :desc)
                  .where private_img: true

  end
end
