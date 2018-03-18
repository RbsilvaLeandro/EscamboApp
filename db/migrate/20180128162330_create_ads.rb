class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title,limite:255
      t.text :description
      t.references :category, index: true, foreign_key: true
      t.references :member

      t.timestamps null: false
    end
  end
end
