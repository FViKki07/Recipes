class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.integer :id_rec
      t.integer :id_prod
      t.float :count
      t.string :measure

      t.timestamps
    end
  end
end
