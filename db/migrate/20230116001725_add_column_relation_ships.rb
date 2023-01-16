class AddColumnRelationShips < ActiveRecord::Migration[6.1]
  def change
    add_column :relation_ships, :article_id, :integer
    add_column :comments, :user_id, :integer
  end
end
