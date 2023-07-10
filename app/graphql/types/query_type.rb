module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :providers, [ProviderType], null: false
    field :products, [ProductType], null: false
    field :students, [StudentType], null: false, description: "Testing", resolver: Resolvers::StudentsSearch
    field :policies, [PolicyType], null: false, resolver: Resolvers::PoliciesSearch

    field :provider, ProviderType, null: false do
      argument :id, ID, required: true
    end
    field :product, ProductType, null: false do
      argument :id, ID, required: true
    end
    field :student, StudentType, null: false, description: "Get single student" do
      argument :id, ID, required: true
    end
    field :policy, PolicyType, null: false do
      argument :id, ID, required: true
    end

    def providers
      Provider.all
    end

    def provider(id:)
      Provider.find(id)
    rescue ActiveRecord::RecordNotFound => e
      GraphQL::ExecutionError.new("Record not found: #{e}")
    end

    def products
      Product.all
    end

    def product(id:)
      Product.find(id)
    rescue ActiveRecord::RecordNotFound => e
      GraphQL::ExecutionError.new("Record not found: #{e}")
    end

    def students
      Student.all
    end

    def student(id:)
      Student.find(id)
    rescue ActiveRecord::RecordNotFound => e
      GraphQL::ExecutionError.new("Record not found: #{e}")
    end

    def policies
      Policy.all
    end

    def policy(id:)
      policy.find(id)
    rescue ActiveRecord::RecordNotFound => e
      GraphQL::ExecutionError.new("Record not found: #{e}")
    end
  end
end
