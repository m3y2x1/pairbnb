class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :listing_name
      t.string :description
      t.integer :max_people
      t.integer :cost_per_night
      t.references :address
      t.references :user

      t.timestamps null: false
    end
  end
end
