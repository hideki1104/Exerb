class GenresController < ApplicationController
  def index
  	@genres = Genre.all
  	@genre = Genre.new
  end

  def create
  	@genre = Genre.new(genre_params)
  	@genre.save
  	redirect_to genres_path
  end


  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
  	genre = Genre.find(params[:id])
  	genre.update(genre_params)
  	redirect_to genres_path
  end

  private
  def genre_params
      params.require(:genre).permit(:class_status, :genre_name)
  end
end
