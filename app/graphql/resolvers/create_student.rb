class Resolvers::CreateStudent < GraphQL::Function
  argument :name, !Types::NameInput
  argument :active, types.Boolean

  type Types::StudentType

  def call(_ctx, args, obj)
    student = Student.new!(
      first_name: args[:name][:first],
      last_name: args[:name][:last],
      active: args[:active] && true
    )

    if student.save
      student
    else
      GraphQL::ExecutionError.new(
        "Invalid input: {#{student.errors.full_messages.join('; ')}}"
      )
    end
  end
end
