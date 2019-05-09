module Types
  class EventType < BaseObject
    field :id, ID, null: false
    field :location, String, null: false
    field :description, String, null: false
    field :title, String, null: false
  end
end
