class ChangeDataBirthDate < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :birth_date, :date
  end
end
