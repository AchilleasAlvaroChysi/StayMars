class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.string :image
      t.string :title
      t.string :description
      t.string :region
      t.string :cp
      t.float :price
      t.float :score

      t.timestamps
    end
  end
end
