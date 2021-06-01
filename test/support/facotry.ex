defmodule FoodDelivery.Factory do
  use ExMachina

  def user_params_factory do
    %{
      age: 29,
      address: "rua xx",
      cep: "12345678",
      cpf: "12345678901",
      email: "Ruby@gmail.com",
      password: "123456",
      name: "Ruby",
    }
  end
end
