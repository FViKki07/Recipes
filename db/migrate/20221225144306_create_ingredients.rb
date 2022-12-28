class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.belongs_to :recipe
      t.belongs_to :product
      t.float :count
      t.string :measure

      t.timestamps
    end
  end
end
