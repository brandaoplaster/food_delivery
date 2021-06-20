defmodule FoodDelivery.Users.CreateTest do
  use FoodDelivery.DataCase, async: true

  alias FoodDelivery.{Error, User}
  alias FoodDelivery.Users.Create

  import FoodDelivery.Factory

  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{id: _id, age: 27, cpf: "12345678901", email: "Ruby@gmail.com"}} =
               response
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
