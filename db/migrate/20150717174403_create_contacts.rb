class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :message
      t.string :nickname

      t.timestamps null: false
    end
  end
end
