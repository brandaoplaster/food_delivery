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

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- FoodDelivery.get_user_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{}} <- FoodDelivery.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end
end
