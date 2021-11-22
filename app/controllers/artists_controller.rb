class ArtistsController < ApplicationController
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

  private
    def artist_params
      params.require(:artist).permit(:name, :category, :debut_year)
    end
end
