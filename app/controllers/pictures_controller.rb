class PicturesController < ApplicationController
  before_action :ensure_logged_in, except: [:show, :index]
  def index
    @pictures = Picture.all
    @age_pictures_desc = Picture.oldest_last
    # @created_before = Picture.created_before(time)
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def create

  @picture = Picture.new

  @picture.title = params[:picture][:title]
  @picture.artist = params[:picture][:artist]
  @picture.url = params[:picture][:url]


    if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

  def update

  @picture = Picture.find(params[:id])

  @picture.title = params[:picture][:title]
  @picture.artist = params[:picture][:artist]
  @picture.url = params[:picture][:url]
  @picture.created_at = params[:picture][:created_at]

    if @picture.save
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end

end
