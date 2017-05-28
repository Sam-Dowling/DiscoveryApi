defmodule DiscoveryApi.ServiceResource do
  use PlugRest.Resource

  def allowed_methods(conn, state) do
    {["HEAD", "GET", "POST", "PUT", "OPTIONS"], conn, state}
  end

  def content_types_provided(conn, state) do
    {[{"application/json", :to_json}], conn, state}
  end

  def to_json(%{params: params} = conn, state) do

    service = DiscoveryApi.Repo.get(params["id"])
    if service do
      {Poison.encode!(%Service{address: service.address, port: service.port, service: service.service}), conn, state}
    else
      {"{\"error\": \"invalid service or no services of that type are availiable.\"}", conn, state}
    end
  end

end
