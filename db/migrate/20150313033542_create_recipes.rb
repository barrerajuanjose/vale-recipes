class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :category
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
