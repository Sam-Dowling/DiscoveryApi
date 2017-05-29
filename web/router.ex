defmodule DiscoveryApi.Router do
  use DiscoveryApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DiscoveryApi do
    pipe_through :api
  end
end
