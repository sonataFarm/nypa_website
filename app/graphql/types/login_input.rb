Types::LoginInput = GraphQL::InputObjectType.define do
  name 'LOGIN'

  argument :username, !types.String
  argument :password, !types.String
end
