module Mutations
  class RegisterForEvent < BaseMutation
    argument :event_id, ID, required: true

    type Types::EventType

    def resolve(event_id: nil)
      unless context[:current_user]
        return GraphQL::ExecutionError.new("Login to register for an event") 
      end

      event = Event.find_by(id: event_id)
      return GraphQL::ExecutionError.new("Event Not Found") unless event

      EventAttendee.create!(
        event_id: event_id,
        user_id: context[:current_user].id
      )
      event
    end
  end
end
