class Resolvers::UpdateStudent < GraphQL::Function
  argument :id, !types.ID
  argument :name, !Types::NameInput
  argument :active, !types.Boolean

  type Types::StudentType

  def call(_ctx, args, obj)
    student = Student.find_by_id(args[:id])

    return GraphQL::ExecutionError.new("Student not found") unless student

    student_params = {
      first_name: args[:name][:first],
      last_name: args[:name][:last],
      active: args[:active]
    };

    if student.update(student_params)
      student
    else
      GraphQL::ExecutionError.new(
        "Invalid entry: #{student.errors.full_messages.join(';')}"
      )
    end
  end
end
