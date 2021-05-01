defmodule FoodDeliveryWeb.UsersController do
  use FoodDeliveryWeb, :controller

  alias FoodDelivery.User
  alias FoodDeliveryWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- FoodDelivery.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
