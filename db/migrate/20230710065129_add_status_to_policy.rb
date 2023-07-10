class AddStatusToPolicy < ActiveRecord::Migration[6.1]
  def change
    add_column :policies, :status, :string, default: "pending", null: false
  end
end
