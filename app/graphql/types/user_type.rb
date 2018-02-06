Types::UserType = GraphQL::ObjectType.define do
  name 'User'

  field :username, !types.String
  field :firstName, !types.String, property: :first_name
  field :lastName, !types.String, property: :last_name
end
