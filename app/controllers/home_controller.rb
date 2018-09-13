class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @images = Image .paginate( page: params[:page] , per_page: 3)
                  .order(id: :desc)
                  .where private_img: true

    @user = User.find current_user.id
    @likes = @user.images
  end

  def Likes

    @image = Image.find params[:id]
    @user = User.find current_user.id
    @search_like = @user.images

    if @search_like.detect{|w| w.id == @image.id}
      @user.images.delete(@image)
      @image.likes_counter = @image.likes_counter - 1
      @image.save
    else
      @user.images << @image
      if ( @image.likes_counter.nil? )
        @image.likes_counter = 1
      else
        @image.likes_counter = @image.likes_counter + 1
      end
      @image.save
    end

    respond_to do |format|
      format.json { render json: false }
    end

  end

end
