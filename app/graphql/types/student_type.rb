Types::StudentType = GraphQL::ObjectType.define do
  name "Student"
  field :first_name, !types.String
  field :last_name, !types.String
  field :active, !types.Boolean
end
