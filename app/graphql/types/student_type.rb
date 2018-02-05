Types::StudentType = GraphQL::ObjectType.define do
  name "Student"
  field :firstName, !types.String, property: :first_name
  field :lastName, !types.String, property: :last_name
  field :active, !types.Boolean
end
