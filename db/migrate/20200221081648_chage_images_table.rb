class ChageImagesTable < ActiveRecord::Migration[5.2]
  def change
    add_reference :images, :items, foreign_key: true
  end
end
