class Resolvers::GetStudentAwards < GraphQL::Function
  argument :student_id, !types.ID

  type !types[Types::AwardType]

  def call(_obj, args, _ctx)
    student = Student.find_by(id: args[:student_id])
    student ? student.awards : []
  end
end
