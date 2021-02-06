class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :password_digest
      t.string :token

      t.timestamps
    end
    add_index :users, :token, unique: true
  end
end
