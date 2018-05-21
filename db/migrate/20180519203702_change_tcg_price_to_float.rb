class ChangeTcgPriceToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :magic_cards, :tcgPrice, :float
  end
end
