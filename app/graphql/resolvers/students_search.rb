require 'search_object'
require 'search_object/plugin/graphql'

class Resolvers::StudentsSearch
  # include SearchObject for GraphQL
  include SearchObject.module(:graphql)

  # scope is starting point for search
  scope { Student.all }

  type types[Types::StudentType]

  # inline input type definition for the advanced filter
  class StudentFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :first_name_contains, String, required: false
    argument :last_name_contains, String, required: false
  end

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  option :filter, type: StudentFilter, with: :apply_filter

  # apply_filter recursively loops through "OR" branches
  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    scope = Student.all
    scope = scope.where('first_name LIKE ?', "%#{value[:first_name_contains]}") if value[:first_name_contains]
    scope = scope.where('last_name LIKE ?', "%#{value[:last_name_contains]}") if value[:last_name_contains]

    branches << scope

    value[:OR].reduce(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?

    branches
  end
  

end