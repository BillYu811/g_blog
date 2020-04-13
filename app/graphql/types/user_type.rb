module Types 
    class UserType < Types::BaseObject
        description "user information"
        field :name, String, null:false
    end
end