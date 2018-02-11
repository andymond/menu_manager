class RemoveEmployeeCreditFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :employee_credit
  end
end
