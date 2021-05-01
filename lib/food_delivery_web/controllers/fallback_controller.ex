defmodule FoodDeliveryWeb.FallbackController do
  use FoodDeliveryWeb, :controller

  alias FoodDelivery.Error
  alias FoodDeliveryWeb.ErrorView

  def call(conn, {:error, %Error{status: status, message: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
