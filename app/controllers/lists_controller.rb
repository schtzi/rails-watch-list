class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @review = Review.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @lists = List.all

    if @list.save
      redirect_to list_path(@list)
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :file)
  end
end
