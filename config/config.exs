# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :food_delivery,
  ecto_repos: [FoodDelivery.Repo]

# Configures the endpoint
config :food_delivery, FoodDeliveryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JADFwH2PJsVnkUM7rojOquP3oAeakn85qrJBSPIAZVsmgsQjUP6m63P3JSkEQcTT",
  render_errors: [view: FoodDeliveryWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: FoodDelivery.PubSub,
  live_view: [signing_salt: "Aw/+SPzY"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
