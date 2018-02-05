Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createStudent, function: Resolvers::CreateStudent.new
end
