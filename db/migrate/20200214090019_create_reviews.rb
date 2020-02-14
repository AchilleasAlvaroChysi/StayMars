class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :body
      t.integer :score
      t.references :user, foreign_key: true
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
