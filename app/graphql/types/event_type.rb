module Types
  class EventType < BaseObject
    field :id, ID, null: false
    field :location, String, null: false
    field :description, String, null: false
    field :title, String, null: false
    field :user, UserType, null: true, method: :user
  end
end
