class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :gender, null: false
      t.string :email, null: false
      t.string :mobile

      t.timestamps
    end
  end
end
