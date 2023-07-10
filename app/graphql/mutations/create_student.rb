module Mutations
  class CreateStudent < BaseMutation
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :gender, String, required: true
    argument :email, String, required: true
    argument :mobile, String, required: false

    type Types::StudentType

    def resolve(first_name:, last_name:, gender:, email:, mobile: nil)
      Student.create!(
        first_name: first_name,
        last_name: last_name,
        gender: gender,
        email: email,
        mobile: mobile
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end