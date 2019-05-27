module Mutations
  class GetUsersForEvent < BaseMutation
    argument :event_id, ID, required: true

    type [Types::UserType]
    def resolve(event_id: nil)
      unless context[:current_user]
        return GraphQL::ExecutionError.new('You need to Login to gain access')
      end

      event = Event.find_by(id: event_id)
      return GraphQL::ExecutionError.new('Event not found') unless event
      unless context[:current_user].id == event.user_id
        return GraphQL::ExecutionError.new('You are not authorized to view the users')
      end

      User.find(event.event_attendees.pluck(:user_id))
    end
  end
end
