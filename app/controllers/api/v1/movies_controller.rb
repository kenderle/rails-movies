class Api::V1::MoviesController < ApplicationController

    has_many :reviews

    before_action :set_movie, only: [:show, :update, :destroy]
    skip_before_action :authenticate, only: [:index, :show]

    # Get our movies
    def index
        @movies = Movie.all 
        render json: @movies
    end

    # Get specific movie with its reviews
    def show
        @reviews = Review.where(movie_id: params[:id])
        render json: { movie: @movie, reviews: @reviews }

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

    # Get our Amazon S3 keys for image uploads
    def get_upload_credentials
        @accessKey = ENV['S3_ACCESS']
        @secretKey = ENV['S3_SECRET']
        render json: { accessKey: @accessKey, secretKey: @secretKey }
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
