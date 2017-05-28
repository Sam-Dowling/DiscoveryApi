defmodule Service do
  @derive [Poison.Encoder]
  defstruct [:address, :port, :service]
end

defmodule DiscoveryApi.ServiceResource do
  use PlugRest.Resource

  def allowed_methods(conn, state) do
    {["HEAD", "GET", "OPTIONS"], conn, state}
  end

  def content_types_provided(conn, state) do
    {[{"application/json", :to_json}], conn, state}
  end

  def to_json(%{params: params} = conn, state) do
    address = "127.0.0.1"
    port = 5000
    service_id = params["id"]
    
    {Poison.encode!(%Service{address: address, port: port, service: service_id}), conn, state}
  end

#   def to_json(%{params: params} = conn, state) do
#     address = "127.0.0.1"
#     port = 5000
#     service_id = params["id"]
#
#     {"{\"address\": \"#{address}\", \"port\", \"#{port}\", \"service\": \"#{service_id}\"}", conn, state}
#   end
end
