class AddMypowerToProfiles < ActiveRecord::Migration
  def change
  	add_column :profiles, :mypower, :string
  end
end
