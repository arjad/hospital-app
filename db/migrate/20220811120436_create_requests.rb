class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.references :user
      t.integer :requestto
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
