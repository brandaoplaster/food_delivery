defmodule FoodDelivery.Users.Get do
  alias Ecto.UUID
  alias FoodDelivery.{Repo, User}

  def by_id(id) do
    with {:ok, uuid} <- UUID.cast(id),
         %User{} = user <- Repo.get(User, uuid) do
      {:ok, user}
    else
      :error -> {:error, %{status: :bad_request, message: "Invalid id format!"}}
      nil -> {:error, %{status: :not_found, result: "User not found!"}}
    end
  end
end
