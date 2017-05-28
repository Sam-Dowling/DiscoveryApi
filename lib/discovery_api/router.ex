defmodule DiscoveryApi.Router do
  use PlugRest.Router
  use Plug.ErrorHandler

  plug :match
  plug :dispatch

  resource "/services/:id", DiscoveryApi.ServiceResource

  match "/heartbeat" do
    send_resp(conn, 200, "#{:os.system_time(:micro_seconds)}") # return 200 OK and the timestamp
  end
end
