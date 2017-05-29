defmodule DiscoveryApi.Router do
  use DiscoveryApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", DiscoveryApi do
    pipe_through :api

    get "/services", ServiceController, :index
    get "/services/:id", ServiceController, :show
    put "/services/:id", ServiceController, :create
  end
end
