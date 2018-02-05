NYPASchema = GraphQL::Schema.define do
  # debugger
  mutation Types::MutationType
  query Types::QueryType
end
