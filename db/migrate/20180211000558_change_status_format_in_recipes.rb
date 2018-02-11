class ChangeStatusFormatInRecipes < ActiveRecord::Migration[5.1]
  def change
    change_column :recipes, :status, 'integer USING CAST(status AS integer)', default: 2
  end
end
