class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.float :count
      t.float :price
      t.float :total
      t.references :category
      t.references :project
      t.timestamps
    end
  end
end
