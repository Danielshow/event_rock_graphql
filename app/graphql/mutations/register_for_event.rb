module Mutations
  class RegisterForEvent < BaseMutation
    argument :event_id, ID, required: true

    type Types::EventType

    def resolve(event_id: nil)
      user = context[:current_user]
      unless user
        return GraphQL::ExecutionError.new('Login to register for an event')
      end

      event = Event.find_by(id: event_id)
      return GraphQL::ExecutionError.new('Event Not Found') unless event

      is_registered = EventAttendee.registered(event.id, user.id)
      unless is_registered.empty?
        return GraphQL::ExecutionError.new('You have registered for this event')
      end

      EventAttendee.create!(
        event_id: event_id,
        user_id: user.id
      )
      event
    end
  end
end
