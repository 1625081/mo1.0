class Score < ActiveRecord::Base
  include Redis::Objects
  counter :viewer

  belongs_to :image
  belongs_to :music

  def generate_score
    return liker.size + favor.size + viewer.value + 5 * editor_rec.size
  end
end
