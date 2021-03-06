class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :user
      t.text :body
      t.references :recipe, foreign_key: true

      t.timestamps null: :false
    end
  end
end
