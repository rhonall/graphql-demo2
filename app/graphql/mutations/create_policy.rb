module Mutations
  class CreatePolicy < BaseMutation
    # arguments passed to the `resolve` method
    argument :start_date, String, required: true
    argument :end_date, String, required: true
    argument :policy_type, String, required: false
    argument :category, String, required: false
    argument :product_id, ID, required: true
    argument :provider_id, ID, required: true
    argument :student_id, ID, required: true

    # return type from the mutation
    type Types::PolicyType

    def resolve(start_date:, end_date:, policy_type: nil, category: nil, product_id:, provider_id:, student_id:)
      provider = Provider.find(provider_id)
      product = Product.find(product_id)
      student = Student.find(student_id)

      Policy.create!(
        start_date: start_date, 
        end_date: end_date,
        policy_type: policy_type,
        category: category,
        product: product,
        provider: provider,
        student: student
      )
    rescue ActiveRecord::RecordNotFound => e
      GraphQL::ExecutionError.new("Record not found: #{e}")
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end