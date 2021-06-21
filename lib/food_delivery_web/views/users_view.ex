defmodule FoodDeliveryWeb.UsersView do
  use FoodDeliveryWeb, :view

  alias FoodDelivery.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created successfully",
      user: user
    }
  end

  def render("user.json", %{user: %User{} = user}), do: %{user: user}
end
