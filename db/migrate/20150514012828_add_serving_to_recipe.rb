class AddServingToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :serving, :string
  end
end
