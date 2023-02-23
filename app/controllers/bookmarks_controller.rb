# class BookmarksController < ApplicationController

#   def new
#     @list = List.find(params[:list_id])
#     @bookmark = Bookmark.new
#     @movies = Movie.all
#   end

#   def create
#     @list = List.find(params[:list_id])
#     @bookmark = @list.bookmarks.new(bookmark_params)
#     if @bookmark.save
#       redirect_to list_path(@list), notice: "Top"
#     else
#       render :new, status: :unprocessable_entity
#     end
#   end

#   def destroy
#   end

#   private

#   def bookmark_params
#     params.require(:bookmark).permit(:movie_id)
#   end
# end


class BookmarksController < ApplicationController
  before_action :set_list
  # before_action :set_movies, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  # def set_movies
  #   @movies = Movie.all
  # end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
