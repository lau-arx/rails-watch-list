class ListsController < ApplicationController
  before_action :find_list, only: [ :show ]
  def index
    @lists = List.all
  end

  def show
    @review = Review.new(list: @list)
    @bookmark = Bookmark.new
  end
  

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save 
      redirect_to lists_path
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private 

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end

end
