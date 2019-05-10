module Mutations
  class CreateEvent < BaseMutation
    argument :data, Types::CreateEventInput, required: true
    
    type Types::EventType
    def resolve(data: nil)
      unless context[:current_user]
        return GraphQL::ExecutionError.new( 'You must be logged in to create an Event')
      end
      Event.create!(
        title: data&.title,
        location: data&.location,
        description: data&.description,
        user: context[:current_user]
      )
    end
  end
end
