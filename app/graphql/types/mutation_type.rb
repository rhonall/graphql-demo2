module Types
  class MutationType < Types::BaseObject
    field :create_provider, mutation: Mutations::CreateProvider
    field :create_product, mutation: Mutations::CreateProduct
  end
end
