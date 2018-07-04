# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :net_store,
  ecto_repos: [NetStore.Repo]

# Configures the endpoint
config :net_store, NetStoreWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uKAZTInOcrCSsW3h82fHtXFIwz6uy29Y/TS/3JTp+XWjcfGjLlKdr6As9Q8tGwev",
  render_errors: [view: NetStoreWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: NetStore.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# config :cors_plug,
#   origin: ["http://example.com"],
#   max_age: 86400,
#   methods: ["GET", "POST"]
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
