class AddSdkIdToMagicSets < ActiveRecord::Migration[5.0]
  def change
    add_column :magic_sets, :sdkID, :string
  end
end
