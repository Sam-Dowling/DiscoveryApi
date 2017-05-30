defmodule DiscoveryApi.Router do
  use DiscoveryApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", DiscoveryApi do
    pipe_through :api

    get "/services", ServiceController, :index
    get "/services/:id", ServiceController, :show
    post "/services/:id", ServiceController, :create

    # get "/services", ServiceController, :regions # gets a list of regions
    # get "/services/:reg", ServiceController, :index # gets a list of services from a region
    # get "/services/:reg/:id", ServiceController, :show # gets an instance of a service (:id) from a region (:reg)
    #
    # post "/services/:reg/:id", ServiceController, :create # registers an instance of service (:id) for region (:reg)
  end
end
