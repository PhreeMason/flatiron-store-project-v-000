class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.belongs_to :category
      t.integer :inventory
      t.decimal :price
    end
  end
end
