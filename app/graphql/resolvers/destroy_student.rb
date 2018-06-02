class Resolvers::DestroyStudent < GraphQL::Function
  argument :id, !types.ID

  type types.Boolean

  def call(_ctx, args, obj)
    student = Student.find_by_id(args[:id])

    if !student
      GraphQL::ExecutionError.new("Student does not exist")
    else
      student.destroy
      true
    end
  end
end
