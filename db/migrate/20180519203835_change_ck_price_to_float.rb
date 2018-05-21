class ChangeCkPriceToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :magic_cards, :ckPrice, :float
  end
end
