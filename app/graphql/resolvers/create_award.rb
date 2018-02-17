class Resolvers::CreateAward < GraphQL::Function
  argument :student_id, !Types::StudentType
  argument :competition, !types.String
  argument :placement, !types.String
  argument :date, !Types::DateType

  type Types::AwardType

  def call(_obj, args, ctx)
    award = Award.new(
      student: Student.find_by(id: args[:student_id]),
      competition: args[:competition],
      placement: args[:placement],
      date: args[:date]
    );

    if award.save
      award
    else
      GraphQL::ExecutionError.new(
        "Invalid request: #{award.errors.full_messages.join(' ')}"
      )
    end
  end
end
