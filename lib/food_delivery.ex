defmodule FoodDelivery do
  alias FoodDelivery.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
