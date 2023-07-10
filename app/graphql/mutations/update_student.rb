module Mutations
  class UpdateStudent < BaseMutation
    # Require an ID to be provided
    argument :id, ID, required: true
    
    # Allow the following fields to be updated
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :mobile, String, required: false

    # Return fields
    field :success, Boolean, null: false
    field :errors, [String], null: false
    field :student, Types::StudentType, null: true

    def resolve(id:, **args)
      student = Student.find(id)

      # Another approach on error handling
      if student.update(args)
        { success: true, student: student, errors: [] }
      else
        { success: false, student: nil, errors: student.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound => e
      { success: false, student: nil, errors: ['record-not-found'] }
    end
  end
end
