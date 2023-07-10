module Mutations
  class DeleteStudent < BaseMutation
    # Require an ID to be provided
    argument :id, ID, required: true

    # Return fields
    field :success, Boolean, null: false
    field :errors, [String], null: false
    field :id, ID, null: true

    def resolve(id:)
      student = Student.find(id)

      if student.destroy
        { success: true, id: id, errors: [] }
      else
        { success: false, id: nil, errors: student.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound => e
      { success: false, id: nil, errors: ['record-not-found'] }
    end
  end
end
