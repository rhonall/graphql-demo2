module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :providers, [ProviderType], null: false, description: "Just testing"

    def providers
      Provider.all
    end

    field :provider, ProviderType, null: false, description: "Get single provider" do
      argument :id, ID, required: true
    end

    def provider(id:)
      Provider.find(id)
    end
  end
end
