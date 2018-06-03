class Resolvers::UpdateAward < GraphQL::Function
  argument :id, !types.ID
  argument :competition, !types.String
  argument :placement, !types.String
  argument :date, !Types::DateType
  argument :student_id, !types.ID

  type Types::AwardType

  def call(_ctx, args, obj)
    award = Award.find_by_id(args[:id])
    return GraphQL::ExecutionError.new("Award not found") unless award

    student = Student.find_by_id(args[:student_id])
    return GraphQL::ExecutionError.new("Student does not exist") unless student

    award_params = {
      competition: args[:competition],
      placement: args[:placement],
      date: args[:date],
      student: student
    };

    if award.update(award_params)
      award
    else
      GraphQL::ExecutionError.new(
        "Invalid entry: #{award.errors.full_messages.join(';')}"
      )
    end
  end
end
