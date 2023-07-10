module Types
  class MutationType < Types::BaseObject
    field :create_provider, mutation: Mutations::CreateProvider
    field :create_product, mutation: Mutations::CreateProduct
    field :create_student, mutation: Mutations::CreateStudent
  end
end
