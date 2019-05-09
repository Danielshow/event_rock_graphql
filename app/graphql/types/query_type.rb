module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :all_events, [EventType], null: false,
      description: "Get all events from the database"
    def all_events
      Event.all
    end
  end
end
