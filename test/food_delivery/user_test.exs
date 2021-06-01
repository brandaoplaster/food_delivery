defmodule FoodDelivery.UserTest do
  use FoodDelivery.DataCase, async: true

  alias Ecto.Changeset
  alias FoodDelivery.User

  describe "changeset/2" do
    test "it should return a valid changeset, when all params are valid" do
      params = %{
        age: 28,
        address: "rua xx",
        cep: "12345678",
        cpf: "12345678901",
        email: "test@gmail.com",
        password_hash: "123456",
        password: "123456",
        name: "Test",
      }

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Test"}, valid?: true} = response
    end

    test "it should return an invalid changeset, when one of the params is invalid" do
      params = %{
        age: 15,
        address: "rua xx",
        cep: "12345678",
        cpf: "12345678901",
        email: "test@gmail.com",
        password: "123",
        name: "Test",
      }

      response = User.changeset(params)

      expected_response = %{age: ["must be greater than or equal to 18"]}

      assert errors_on(response) == expected_response
    end
  end

  describe "update_changeset/2" do
    test "it should return a valid changeset, when updated params are valid" do
      params = %{
        age: 28,
        address: "rua xx",
        cep: "12345678",
        cpf: "12345678901",
        email: "test@gmail.com",
        password_hash: "123456",
        password: "123456",
        name: "Test",
      }

      update_params = %{name: "Ruby"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "Ruby"}, valid?: true} = response
    end
  end
end
