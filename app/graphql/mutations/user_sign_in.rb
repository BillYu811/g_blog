module Mutations
  class UserSignIn < BaseMutation
    argument :name, String, required: true
    argument :password, String, required: true

    field :id, ID, null: true
    field :token, String, null: true
    field :errors, [String], null: true

    def resolve(**inputs)
      wrong_msg = {errors: ['wrong username or password.']}

      return wrong_msg unless inputs[:name] && inputs[:password]

      user = User.find_by name: inputs[:name]

      #wrong account and passwd
      return wrong_msg unless user
      return wrong_msg unless user.authenticate(inputs[:password])

      #create a JWT sign
      context[:session][:JWTtoken] = user.token
      {id: user.id, token: user.token}
    end

  end
end