module Mutations
  class UpdateEvent < BaseMutation
    argument :id, ID, required: true
    argument :data, Types::UpdateEventInput, required: true

    type Types::EventType

    def resolve(id: nil, data: nil)
      user = context[:current_user]
      unless user
        return GraphQL::ExecutionError.new('You are not Authorized to do this')
      end

      event = Event.find_by(id: id)
      return GraphQL::ExecutionError.new('No Event Found') unless event
      return GraphQL::ExecutionError.new('You can only edit your event') if event.user_id != user.id
      event.location = data&.location || event.location
      event.description = data&.description || event.description
      event.title = data&.title || event.title
      event.save!
      event
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(',')}")
    end
  end
end
