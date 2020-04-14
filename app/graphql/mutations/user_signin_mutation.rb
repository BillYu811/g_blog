class Mutations::UserSignin < Mutations::BaseMutation
    null true

    argument :name, String, required: true
    argument :password, String, required: true

    field :id, ID, null:false
    field :error, [String], null:false

    def resolve(name:,password:)
        user = User.new
        User.name = name
        User.password = password
        if user.save {
            id: user.id
            errors: []
        }else{
            id: nil
            errors: ['signin failed.']
        }

    end
end