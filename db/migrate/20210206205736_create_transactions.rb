class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :category, null: false, foreign_key: true
      t.integer :amount
      t.string :note
      t.date :date

      t.timestamps
    end
  end
end
