module Types
  class UpdateEventInput < BaseInputObject
    argument :title, String, required: false
    argument :description, String, required: false
    argument :location, String, required: false
  end
end
