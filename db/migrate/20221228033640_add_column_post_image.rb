class AddColumnPostImage < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :post_image, :string
  end
end
