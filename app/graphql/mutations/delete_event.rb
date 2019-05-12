module Mutations
  class DeleteEvent < BaseMutation
    argument :id, ID, required: true

    type Types::EventType

    def resolve(id: nil)
      user = context[:current_user]
      return GraphQL::ExecutionError.new('You can\'t perform this operation') unless user
      event = Event.find_by(id: id)
      return GraphQL::ExecutionError.new('Event not found') unless event
      return GraphQL::ExecutionError.new('You are not authorized to do this') unless user.id == event.user_id
      event.destroy!
      event
    end
  end
end
