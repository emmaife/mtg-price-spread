class CreateMagicSets < ActiveRecord::Migration[5.0]
  def change
    create_table :magic_sets do |t|
      t.string :setName
      t.integer :tcgID
      t.integer :ckID

      t.timestamps
    end
  end
end
