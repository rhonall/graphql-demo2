module Types
  class MutationType < Types::BaseObject
    field :create_provider, mutation: Mutations::CreateProvider
    field :create_product, mutation: Mutations::CreateProduct

    field :create_policy, mutation: Mutations::CreatePolicy
    field :approve_policy, mutation: Mutations::ApprovePolicy
    
    field :create_student, mutation: Mutations::CreateStudent
    field :update_student, mutation: Mutations::UpdateStudent
    field :delete_student, mutation: Mutations::DeleteStudent
  end
end
