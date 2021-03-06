Types::StudentType = GraphQL::ObjectType.define do
  name "Student"

  field :id, !types.ID
  field :firstName, !types.String, property: :first_name
  field :lastName, !types.String, property: :last_name
  field :active, !types.Boolean
  field :awards, types[!Types::AwardType]
end
