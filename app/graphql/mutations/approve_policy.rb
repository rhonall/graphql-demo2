module Mutations
  class ApprovePolicy < BaseMutation
    # Require an ID to be provided
    argument :id, ID, required: true

    # Return fields
    field :success, Boolean, null: false
    field :errors, [String], null: false
    field :policy, Types::PolicyType, null: true

    def resolve(id:)
      policy = Policy.find(id)

      if policy.update(status: "approved")
        { success: true, policy: policy, errors: [] }
      else
        { success: false, policy: nil, errors: policy.errors.full_messages }
      end
    rescue ActiveRecord::RecordNotFound => e
      { success: false, policy: nil, errors: ['record-not-found'] }
    end
  end
end