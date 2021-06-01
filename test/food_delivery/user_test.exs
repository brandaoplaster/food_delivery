defmodule FoodDelivery.UserTest do
  use FoodDelivery.DataCase, async: true

  import FoodDelivery.Factory

  alias Ecto.Changeset
  alias FoodDelivery.User

  describe "changeset/2" do
    test "it should return a valid changeset, when all params are valid" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Ruby"}, valid?: true} = response
    end

    test "it should return an invalid changeset, when one of the params is invalid" do
      params = build(:user_params, %{age: 15})

      response = User.changeset(params)

      expected_response = %{age: ["must be greater than or equal to 18"]}

      assert errors_on(response) == expected_response
    end
  end

  describe "update_changeset/2" do
    test "it should return a valid changeset, when updated params are valid" do
      params = params = build(:user_params)

      update_params = %{name: "Ruby"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "Ruby"}, valid?: true} = response
    end
  end
end
