
class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :listing_name
      t.string :room_type
      t.string :description
      t.string :image
      t.integer :no_bedroom
      t.integer :no_bathroom
      t.integer :no_bed  
      t.integer :max_people
      t.integer :cost_per_night
      t.string :address
      t.string :city
      t.string :state
      t.string :country
  
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end

