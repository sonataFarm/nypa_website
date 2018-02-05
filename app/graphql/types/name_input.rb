Types::NameInput = GraphQL::InputObjectType.define do
  name 'NAME'

  argument :first, !types.String
  argument :last, !types.String
end
