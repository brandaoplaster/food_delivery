defmodule FoodDelivery do
  alias FoodDelivery.Items.Create, as: ItemCreate

  alias FoodDelivery.Users.Create, as: UserCreate
  alias FoodDelivery.Users.Delete, as: UserDelete
  alias FoodDelivery.Users.Get, as: UserGet
  alias FoodDelivery.Users.Update, as: UserUpdate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
  defdelegate delete_user(id), to: UserDelete, as: :call
  defdelegate update_user(params), to: UserUpdate, as: :call

  defdelegate create_item(params), to: ItemCreate, as: :call
end
