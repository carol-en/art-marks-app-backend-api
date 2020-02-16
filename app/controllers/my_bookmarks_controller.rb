class MyBookmarksController < ApplicationController
  before_action :set_my_bookmark, only: [ :update, :destroy]

  # GET /bookmarks
  def index
    @my_bookmarks = MyBookmark.all.reverse

    render json: @my_bookmarks
  end

  # POST /bookmarks
  def create
    @my_bookmark = MyBookmark.new(my_bookmark_params)

    if @my_bookmark.save
      render json: @my_bookmark, status: :created, location: @my_bookmark
    else
      render json: @my_bookmark.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookmarks/1
  def update
    @my_bookmark.update(my_bookmark_params)
    render(json: {my_bookmark: @my_bookmark})
  end

  # DELETE /bookmarks/1
  def destroy
    @my_bookmark.destroy
    render(status: 204)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_bookmark
      @my_bookmark = MyBookmark.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def my_bookmark_params
      params.require(:my_bookmark).permit(:site_name, :category, :url, :img, :description)
    end
end
