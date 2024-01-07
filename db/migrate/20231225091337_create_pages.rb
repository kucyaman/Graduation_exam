class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.integer :page_number, null: false
      t.string :photo
      t.string :content
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
