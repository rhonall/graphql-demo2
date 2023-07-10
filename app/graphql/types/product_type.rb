module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :provider, ProviderType, null: false
    field :policies, [PolicyType], null: true
  end
end
