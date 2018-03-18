class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :description,limite: 60

      t.timestamps null: false
    end
  end
end
