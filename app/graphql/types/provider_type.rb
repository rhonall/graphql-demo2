module Types
  class ProviderType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :policy_type, String, null: false
    field :products, [ProductType], null: false
    field :policies, [PolicyType], null: true
  end
end
