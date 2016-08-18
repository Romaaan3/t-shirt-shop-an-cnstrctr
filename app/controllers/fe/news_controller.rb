class Fe::NewsController < ApplicationController
  def index
    @news = News.paginate(:page => params[:page], :per_page => 6)
    @active_block = Block.find_by_name("Новости")
  end

  def show
    @news = News.find(params[:id])
    @title = @news.title
    @last2 = News.last(2)
    @active_block = Block.find_by_name("Новости")
  end
end
