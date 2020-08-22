class API::V1::MoviesController < ApplicationController

    before_action :set_movie, only: [:show, :update, :destroy]
    skip_before_action :authenticate, only: [:index, :show]

    # Get our movies
    def index
        @movies = Movie.all 
        render json: @movies
    end

    # Get specific movie
    def show
        render json: { movie: @movie }

    end

    # Create movie
    def create 
        @movie = Movie.new(movie_params)
        if @movie.save
            render json: @movie
        else
            render json: @movie.errors, status: :unprocessable_entity
        end
    end

    # Update movie
    def update 
        if @movie.update(movie_params)
            render json: @movie
        else
            render json: @movie.errors, status: :unprocessable_entity
        end
    end

    # Delete movie
    def destroy 
        @movie.destroy
    end

    private
    #Methods under private are only accessible within this controller, not outside of it

    def set_movie
        @movie = Movie.find(params[:id])
    end

    def movie_params
        params.require(:movie).permit(:title, :description, :parental_rating, :year, :total_gross, :duration, :image, :cast, :director)
    end

end
