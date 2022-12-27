class CreateRelationShips < ActiveRecord::Migration[6.1]
  def change
    create_table :relation_ships do |t|

      t.timestamps
    end
  end
end
