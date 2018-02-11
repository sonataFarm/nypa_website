Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :allStudents do
    type !types[Types::StudentType]
    description "Get all students"
    resolve ->(obj, args, ctx) { Student.all }
  end

  field :student do
    type Types::StudentType
    argument :id, !types.ID
    description "Find a Student by ID"
    resolve ->(obj, args, ctx) { Student.find_by(id: args['id']) }
  end

  field :currentUser do
    type Types::UserType
    description "Get the Current User"
    resolve ->(obj, args, ctx) { ctx[:current_user] }
  end
end
