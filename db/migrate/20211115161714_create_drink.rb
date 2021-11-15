class CreateDrink < ActiveRecord::Migration[6.1]
  def change
    create_table :drinks do |t|
      t.integer :user_id
      t.integer :cocktail_id

      t.timestamps
    end
  end
end
