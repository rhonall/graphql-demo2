module Mutations
  class CreateProvider < BaseMutation
    # arguments passed to the `resolve` method
    argument :name, String, required: true
    argument :policy_type, String, required: true

    # return type from the mutation
    type Types::ProviderType

    def resolve(name: nil, policy_type: nil)
      Provider.create!(
        name: name,
        policy_type: policy_type
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end