module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :user_signin, mutation: Mutations::UserSignin

    # need context
    field :post_blog, mutation: Mutations::PostBlog
    field :delete_blog, mutation: Mutations::DeleteBlog
  end
end
