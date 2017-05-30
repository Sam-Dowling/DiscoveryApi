defmodule DiscoveryApi.Router do
  use DiscoveryApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", DiscoveryApi do
    pipe_through :api

    # get "/services", ServiceController, :index
    # get "/services/:id", ServiceController, :show
    # post "/services/:id", ServiceController, :create

    get "/services", ServiceController, :list # gets a list of services
    get "/services/:id", ServiceController, :regions # gets a list of regions for a service (:id)
    get "/services/:id/:reg", ServiceController, :get # gets an instance of a service (:id) from a region (:reg)

    post "/services/:id/:reg", ServiceController, :create # registers an instance of service (:id) for region (:reg)
  end
end
