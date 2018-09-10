class ImagesController < ApplicationController

  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def set_image
    @image = Image.find params[:id]
  end

  def index
    @images = Image.where user_id: current_user.id
  end

  def show
  end

  def destroy
    @image.destroy
    redirect_to action: "index"
  end

  def new
    @image = Image.new
  end

  def create
    #render plain: params[:image].inspect
    #
    @image = current_user.images.new image_params
    @image.save

    if @image.save
      return redirect_to images_path
    end

    render :new
  end

  def edit

  end

  def update
    if ( @image.update(image_params) )
      return redirect_to images_path
    end
    render :edit
  end

  #Interface Parametros Fuertes
  def image_params
    params.require(:image).permit(:title, :description , :picture , :private_img)
  end

end
