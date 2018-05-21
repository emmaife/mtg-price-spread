class CreateMagicCards < ActiveRecord::Migration[5.0]
  def change
    create_table :magic_cards do |t|
      t.integer :productID
      t.string :name
      t.integer :tcgPrice
      t.integer :ckPrice
      t.boolean :isFoil
      t.string :set

      t.timestamps
    end
  end
end
