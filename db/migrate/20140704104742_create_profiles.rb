class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.text :description
      t.date :birthday
      t.string :sex
      
      t.references :user, index: true

      t.timestamps
    end
  end
end
