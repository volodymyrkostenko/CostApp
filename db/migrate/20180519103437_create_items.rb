class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.float :count
      t.float :price
      t.float :total
      t.references :category, foreign_key: true
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
