defmodule FoodDeliveryWeb.UsersView do
  use FoodDeliveryWeb, :view

  alias FoodDelivery.User

  def render("create.json", %{user: %User{}} = user) do
    %{
      message: "User created!",
      user: %{
        id: user.id,
        name: user.name
      }
    }
  end
end
