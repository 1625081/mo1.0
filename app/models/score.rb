class Score < ActiveRecord::Base
  include Redis::Objects
  counter :viewer
  
  belongs_to :image

  def generate_score(likes, favors, views, datetime)
  end
end
