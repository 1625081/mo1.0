class ItemController < ApplicationController
  
  def favor
    if params[:class] == "Video"
      @treasure = Video.where("id = ?", params[:item_id].to_i).last
      respond_to do |format|
        if current_user.favor @treasure
          format.html { redirect_to @treasure, notice: 'Favor Success！' }
          format.json { head :no_content }
        else
          format.html { redirect_to @treasure, warning: '操作失败，请重试！' }
          format.json { head :no_content }
        end
      end
    end
    
    if params[:class] == "Image"
      @treasure = Image.where("id = ?", params[:item_id].to_i).last
      respond_to do |format|
        if current_user.favor @treasure
          format.html { redirect_to @treasure, notice: 'Favor Success！' }
          format.json { head :no_content }
        else
          format.html { redirect_to @treasure, warning: '操作失败，请重试！' }
          format.json { head :no_content }
        end
      end
    end
    
    if params[:class] == "Article"
      @treasure = Article.where("id = ?", params[:item_id].to_i).last
      respond_to do |format|
        if current_user.favor @treasure
          format.html { redirect_to @treasure, notice: 'Favor Success！' }
          format.json { head :no_content }
        else
          format.html { redirect_to @treasure, warning: '操作失败，请重试！' }
          format.json { head :no_content }
        end
      end
    end

  end

  def unfavor
    if params[:class] == "Video"
      @treasure = Video.where("id = ?", params[:item_id].to_i).last
      respond_to do |format|
        if current_user.unfavor @treasure
          format.html { redirect_to @treasure, notice: '收藏已取消！' }
          format.json { head :no_content }
        else
          format.html { redirect_to @treasure, warning: '操作失败，请重试！' }
          format.json { head :no_content }
        end
      end
    end
    
    if params[:class] == "Image"
      @treasure = Image.where("id = ?", params[:item_id].to_i).last
      respond_to do |format|
        if current_user.unfavor @treasure
          format.html { redirect_to @treasure, notice: '收藏已取消！' }
          format.json { head :no_content }
        else
          format.html { redirect_to @treasure, warning: '操作失败，请重试！' }
          format.json { head :no_content }
        end
      end
    end
    
    if params[:class] == "Article"
      @treasure = Article.where("id = ?", params[:item_id].to_i).last
      respond_to do |format|
        if current_user.unfavor @treasure
          format.html { redirect_to @treasure, notice: '收藏已取消！' }
          format.json { head :no_content }
        else
          format.html { redirect_to @treasure, warning: '操作失败，请重试！' }
          format.json { head :no_content }
        end
      end
    end

  end






end
