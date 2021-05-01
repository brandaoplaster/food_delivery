defmodule FoodDelivery.Users.Delete do
  alias Ecto.UUID
  alias FoodDelivery.{Repo, User}

  def call(id) do
    with {:ok, uuid} <- UUID.cast(id),
         %User{} = user <- Repo.get(User, uuid) do
      Repo.delete(user)
    else
      :error -> {:error, %{status: :bad_request, message: "Invalid id format!"}}
      nil -> {:error, %{status: :not_found, result: "User not found!"}}
    end
  end
end
