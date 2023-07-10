require 'search_object'
require 'search_object/plugin/graphql'

class Resolvers::PoliciesSearch
  # include SearchObject for GraphQL
  include SearchObject.module(:graphql)

  # scope is starting point for search
  scope { Policy.all }

  type types[Types::PolicyType]

  # inline input type definition for the advanced filter
  class PolicyFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :policy_type_is, String, required: false
  end

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  option :filter, type: PolicyFilter, with: :apply_filter

  # apply_filter recursively loops through "OR" branches
  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    scope = Policy.all
    scope = scope.where('policy_type LIKE ?', "%#{value[:policy_type_is]}") if value[:policy_type_is]

    branches << scope

    value[:OR].reduce(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?

    branches
  end
  

end