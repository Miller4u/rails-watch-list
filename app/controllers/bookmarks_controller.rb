class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new # Needed to instantiate the form_with not its the get method.
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    # No need for app/views/lists/destroy.html.erb
    redirect_to lists_path, status: :see_other
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
