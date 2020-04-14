module Mutations
  class UserSignIn < BaseMutation
    null true

    argument :name, String, required: true
    argument :password, String, required: true

    field :id, ID, null: false
    field [:errors], null: true
    field :msg, String, null: true

    def resolve(name, password)
      @user = User.new(name: name, password: password, password_confirmation:password)
      return errors['sigin failed'] unless @user.save
      user.id
    end
  end
end