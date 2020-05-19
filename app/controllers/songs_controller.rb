class SongsController < ApplicationController
    before_action :find, only: [:show, :edit, :update, :destroy]
    
    def index
        @songs = Song.all
    end

    def show
    end

    def edit
    end

    def update

        if @song.update(song_params)
            redirect_to song_path(@song)
        else
            render :edit
        end

    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)
 
        if @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def destroy
        @song.delete
        redirect_to songs_path
    end

    private

    def find
        @song = Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:artist_name, :title, :released, :release_year, :genre)
    end

end