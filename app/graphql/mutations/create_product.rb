module Mutations
  class CreateProduct < BaseMutation
    class LinkedProvider < Types::BaseInputObject
    end

    # arguments passed to the `resolve` method
    argument :name, String, required: true
    argument :provider_id, ID, required: true

    # return type from the mutation
    type Types::ProductType

    def resolve(name: nil, provider_id: nil)
      provider = Provider.find(provider_id)
      Product.create!(
        name: name,
        provider: provider
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    rescue ActiveRecord::RecordNotFound => e
      GraphQL::ExecutionError.new("Record not found: #{e}")
    end
  end
end