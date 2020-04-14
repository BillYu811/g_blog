module Types
  class MutationType < Types::BaseObject

    field :user_sign_in, mutation: Mutations::UserSignIn

    # need context
    #field :post_blog, mutation: Mutations::PostBlogMutation
    #field :delete_blog, mutation: Mutations::DeleteBlogMutation
  end
end
