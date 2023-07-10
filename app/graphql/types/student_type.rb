module Types
  class StudentType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :gender, String, null: false
    field :email, String, null: false
    field :mobile, String, null: true
    field :full_name, String, null: false
    field :policies, [PolicyType], null: true

    def full_name
      "#{object.first_name} #{object.last_name}"
    end
  end
end
