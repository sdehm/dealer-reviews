# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# third-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :cars_shop, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:cars_shop, :key)
#
# You can also configure a third-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#

config :crawly,
  closespider_timeout: 10,
  concurrent_requests_per_domain: 1,
  middlewares: [
    Crawly.Middlewares.DomainFilter,
    Crawly.Middlewares.UniqueRequest,
    Crawly.Middlewares.RobotsTxt
    # {Crawly.Middlewares.UserAgent, user_agents: ["Crawly Bot"]}
  ]

# pipelines: [
#   {Crawly.Pipelines.Validate, fields: [:url, :title]},
#   {Crawly.Pipelines.DuplicatesFilter, item_id: :title},
#   Crawly.Pipelines.JSONEncoder,
#   {Crawly.Pipelines.WriteToFile, extension: "jl", folder: "/tmp"}
# ]