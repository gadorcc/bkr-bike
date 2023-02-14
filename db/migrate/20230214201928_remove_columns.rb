class RemoveColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :bikes, :bike_postcode
  end
end
