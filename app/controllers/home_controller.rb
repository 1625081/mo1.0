class HomeController < ApplicationController
  def index
    
  end

  def timeline
    if params[:search]
      @sitems = []
      @items = []
      @sitems += Image.all
      @sitems += Music.all
      @sitems += Video.all
      @sitems += Article.all
      for sitem in @sitems 
        msplit = sitem.title.split(params[:search],2) 
        if msplit[0] !=  sitem.title
           if sitem.mo_item[:class] == "Music" 
              @items += Music.where("title = ?",sitem.title)
            end
            if sitem.mo_item[:class] == "Article" 
              @items += Article.where("title = ?",sitem.title)
            end
            if sitem.mo_item[:class] == "Video" 
              @items += Video.where("title = ?",sitem.title)
            end
            if sitem.mo_item[:class] == "Image" 
              @items += Image.where("title = ?",sitem.title)
            end
        end
      end 
    else
      @items = []
      @items += Image.all
      @items += Music.all
      @items += Video.all
      @items += Article.all
    end
  end

  def video
  end

end
