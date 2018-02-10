class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.text :name
      t.text :instructions
      t.string :status
      t.string :employee_credit
      t.text :image

      t.timestamps null: false
    end
  end
end
