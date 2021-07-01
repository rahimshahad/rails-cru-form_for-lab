class ArtistsController < ApplicationController
    def index
        @artist = Artist.all
    end

    def show
        @artist = Artist.find_by_id(params[:id])
    end

    def new
        @artist =Artist.new
    end

    def create
        @artist = Artist.create(artist_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    def edit
        @artist = Artist.find_by_id(params[:id])
    end

    def update
        @artist = Artist.find_by_id(params[:id])
        @artist = Artist.update(artist_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    private
    def artist_params(*args)
        params.require(:artist).permit(*args)
    end
end