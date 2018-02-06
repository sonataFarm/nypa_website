Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

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
