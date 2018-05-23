class AddCkUpdatedOnToMagicCards < ActiveRecord::Migration[5.0]
  def change
  	add_column :magic_cards, :ck_updated_on, :datetime
  end
end
