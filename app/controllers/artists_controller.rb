class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show edit update destroy]

  def index
    @artists = Artist.all()
  end

  def new
    @artist = Artist.new()
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def show
    @artist
  end

  def edit
    @artist
  end

  def update
    if @artist.update(artist_params)
      redirect_to @artist
    else
      render :new
    end
  end

  def destroy
    @artist.destroy

    redirect_to(artists_url)    
  end

  private
    def artist_params
      params.require(:artist).permit(:name, :category, :debut_year)
    end

    def set_artist
      @artist = Artist.find(params[:id])
    end
end
