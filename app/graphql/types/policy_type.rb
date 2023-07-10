module Types
  class PolicyType < Types::BaseObject
    field :id, ID, null: false
    field :start_date, String, null: false
    field :end_date, String, null: false
    field :policy_type, String, null: true
    field :category, String, null: true
    field :status, String, null: false
    field :product, ProductType, null: false
    field :provider, ProviderType, null: false
    field :student, StudentType, null: false
  end
end
