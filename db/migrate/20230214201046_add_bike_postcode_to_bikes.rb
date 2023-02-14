class AddBikePostcodeToBikes < ActiveRecord::Migration[7.0]
  def change
    add_column :bikes, :bike_postcode, :string
  end
end
