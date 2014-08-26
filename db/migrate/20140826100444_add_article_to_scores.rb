class AddArticleToScores < ActiveRecord::Migration
  def change
    add_reference :scores, :article, index: true
  end
end
