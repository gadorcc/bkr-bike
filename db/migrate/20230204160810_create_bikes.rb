class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.string :title
      t.text :description
      t.string :type
      t.float :price
      t.boolean :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
