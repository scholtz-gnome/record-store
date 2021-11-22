class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show]

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

  private
    def artist_params
      params.require(:artist).permit(:name, :category, :debut_year)
    end

    def set_artist
      @artist = Artist.find(params[:id])
    end
end
