class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :tel
      t.text :address
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
