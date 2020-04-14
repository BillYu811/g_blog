class Mutations::UserSignin < Mutations::BaseMutation
  null true

  argument :name, String, required: true
  argument :password, String, required: true

  field :id, ID, null:false
  field :error, [String], null:false

  def resolve(name, password)
    user = User.new(name: name, password: password)
    return erros: ['sigin failed'] unless user.save
    user.id
  end
end
