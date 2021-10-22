class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    bookmark.list = @list
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmarks_params)
    bookmark.list_id = @list_id
    if @bookmark.valid?
      @bookmark.salve!
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = bookmark.find(params[:id])
    @bookmark.destroy
  end

  private

  def bookmarks_params
    params.require(:bookmarks).permit(:comment)
  end
end
