Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createUser, function: Resolvers::CreateUser.new
  field :createSession, function: Resolvers::CreateSession.new
  field :destroySession, function: Resolvers::DestroySession.new
  field :createStudent, function: Resolvers::CreateStudent.new
  field :updateStudent, function: Resolvers::UpdateStudent.new
  field :createAward, function: Resolvers::CreateAward.new
end
