module Mutations
  class CreateProduct < BaseMutation
    # arguments passed to the `resolve` method
    argument :name, String, required: true
    argument :provider_id, ID, required: true

    # return type from the mutation
    type Types::ProductType

    def resolve(name:, provider_id:)
      provider = Provider.find(provider_id)

      Product.create!(
        name: name,
        provider: provider
      )
    rescue ActiveRecord::RecordNotFound => e
      GraphQL::ExecutionError.new("Record not found: #{e}")
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end