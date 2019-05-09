module Mutations
  class CreateEvent < BaseMutation
    argument :data, Types::CreateEventInput, required: true
    
    type Types::EventType
    def resolve(data: nil)
      Event.create!(
        title: data&.title,
        location: data&.location,
        description: data&.description
      ) 
    end
  
  end
end
