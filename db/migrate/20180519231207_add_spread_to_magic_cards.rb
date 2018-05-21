class AddSpreadToMagicCards < ActiveRecord::Migration[5.0]
  def change
    add_column :magic_cards, :spread, :float
  end
end
