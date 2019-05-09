class AddUserToEvents < ActiveRecord::Migration[6.0]
  def change
    change_table :events do |t|
      t.references :users, foreign_key: 'creator_id'
    end
  end
end
