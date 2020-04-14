module Types 
    class UserType < Types::BaseObject
        description "user information"
        field :name, String, null: false
        field :blogs, [BlogType], null: true
    end
end