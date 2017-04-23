class AddColumnToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :pic, :string
  end
end
