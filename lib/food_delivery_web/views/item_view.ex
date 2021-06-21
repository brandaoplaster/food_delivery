defmodule FoodDeliveryWeb.ItemsView do
  use FoodDeliveryWeb, :view

  alias FoodDelivery.Item

  def render("create.json", %{item: %Item{} = item}) do
    %{
      message: "Item created successfully",
      item: item
    }
  end
end
