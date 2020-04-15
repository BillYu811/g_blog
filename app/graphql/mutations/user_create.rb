module Mutations
  class UserCreate < BaseMutation
    argument :name, String, required: true
    argument :password, String, required: true

    field :id, ID, null: true
    field :errors, [String], null: true

    def resolve(**inputs)
      inputs[:password_confirmation] = inputs[:password]
      user = User.new(inputs)
      if user.save
        {id: user.id, errors: []}
      else
        {id: nil, errors: ['create user failed.']}
      end
    end
  end
end