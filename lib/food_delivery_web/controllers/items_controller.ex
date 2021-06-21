defmodule FoodDeliveryWeb.ItemsController do
  use FoodDeliveryWeb, :controller

  alias FoodDelivery.Item
  alias FoodDeliveryWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Item{} = item} <- FoodDelivery.create_item(params) do
      conn
      |> put_status(:created)
      |> render("create.json", item: item)
    end
  end
end
