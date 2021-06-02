defmodule FoodDelivery.Users.CreateTest do
  use FoodDelivery.DataCase, async: true

  import FoodDelivery.Factory

  alias Ecto.Changeset
  alias FoodDelivery.{Error, User}
  alias FoodDelivery.Users.Create

  describe "call/1" do
    test "when all params are valid, returns the user" do
      result =
        build(:user_params)
        |> Create.call()

      assert {:ok, %User{id: _id, age: 29, email: "Ruby@gmail.com"}} = result
    end

    test "when there are invalid params, returns an error" do
      response =
        build(:user_params, %{age: 15})
        |> Create.call()

      expected_response = %{age: ["must be greater than or equal to 18"]}

      assert {:error, %Error{status: :bad_request, message: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
