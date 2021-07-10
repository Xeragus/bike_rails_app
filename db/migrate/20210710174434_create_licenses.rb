class CreateLicenses < ActiveRecord::Migration[6.0]
  def change
    create_table :licenses do |t|
      t.string :license_number, type: :string, null: false#, unique: true
      t.string :name, null: false
      t.string :date_of_birth, null: false
      t.string :email, null: false#, index: { unique: true }
      t.timestamps
    end
  end
end
