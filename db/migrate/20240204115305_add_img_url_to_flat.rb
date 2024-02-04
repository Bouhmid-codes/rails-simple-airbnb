class AddImgUrlToFlat < ActiveRecord::Migration[7.1]
  def change
    add_column :flats, :img_url, :string
  end
end
