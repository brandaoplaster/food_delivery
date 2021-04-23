defmodule FoodDeliveryWeb.WelcomeController do
  use FoodDeliveryWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> text("Welcome !")
  end
end
