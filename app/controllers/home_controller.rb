class HomeController < ApplicationController
  def index
  end

  def timeline
    @items = []
    @items += Image.all.map{|i| i.mo_item}
    @items += Music.all.map{|i| i.mo_item}
    @items += Video.all.map{|i| i.mo_item}
  end
  
  def video
  end
end
