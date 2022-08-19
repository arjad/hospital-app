class CreateHospitaltreatments < ActiveRecord::Migration[5.1]
  def change
    create_table :hospitaltreatments do |t|
      t.string :price
      t.references :hospital, foreign_key: true
      t.references :treatment, foreign_key: true

      t.timestamps
    end
  end
end