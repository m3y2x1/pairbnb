class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :listing_name
      t.string :description
      t.integer :max_people
      t.integer :cost_per_night
      t.reference :address
      t.reference :user

      t.timestamps null: false
    end
  end
end
