defmodule FoodDelivery.Users.Create do
  alias FoodDelivery.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
