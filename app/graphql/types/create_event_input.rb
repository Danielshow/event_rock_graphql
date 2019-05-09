module Types
  class CreateEventInput < BaseInputObject
    graphql_name 'CreateEventInput'
    argument :title, String, required: true
    argument :description, String, required: true
    argument :location, String, required: true
  end
end
