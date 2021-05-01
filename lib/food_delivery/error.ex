defmodule FoodDelivery.Error do
  @keys [:status, :message]

  @enforce_keys @keys

  defstruct @keys

  def build(status, message) do
    %__MODULE__{
      status: status,
      message: message
    }
  end

  def build_user_not_found_error, do: build(:no_found, "User not found")
  def build_id_format_error, do: build(:bad_request, "Invalid id format")
end
