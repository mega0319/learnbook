class AddColumnsToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :cohort_name, :string
    add_column :profiles, :cohort_date, :string
  end
end
