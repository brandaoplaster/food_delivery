defmodule FoodDelivery.Users.Delete do
  alias FoodDelivery.{Error, Repo, User}

  def call(id) do
    with %User{} = user <- Repo.get(User, id) do
      Repo.delete(user)
    else
      nil -> {:error, Error.build_user_not_found_error()}
    end
  end
end
