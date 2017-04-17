class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :first_name, :last_name
      t.string :occupation
      t.string :birthdate
      t.string :location
      t.string :favorite_quote
      t.string :email
      t.string :phone_number
      t.string :about_me
      t.string :facebook
      t.string :instagram
      t.string :twitter
      t.string :linkedin
      t.string :slack
      t.string :learnco
      t.string :github
      t.string :learnco
      t.integer :user_id
      t.timestamps
    end
  end
end
