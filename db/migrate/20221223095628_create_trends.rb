class CreateTrends < ActiveRecord::Migration[7.0]
  def change
    create_table :trends do |t|
      t.string :session_id
      t.string :search

      t.timestamps
    end
  end
end
