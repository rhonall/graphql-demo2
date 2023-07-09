class CreatePolicies < ActiveRecord::Migration[6.1]
  def change
    create_table :policies do |t|
      t.string :start_date, null: false
      t.string :end_date, null: false
      t.string :policy_type
      t.string :category
      t.references :provider, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
