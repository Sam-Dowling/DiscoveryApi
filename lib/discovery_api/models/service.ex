defmodule Service do
  @derive [Poison.Encoder]
  defstruct [:address, :port, :service]
end

defmodule DiscoveryApi.Repo do
  @service_repo %{"customerapi" => [struct(Service, %{address: "127.0.0.1", port: 5000, service: "customerapi"})]}


  def get(service) do
    Enum.at(@service_repo["#{service}"], 0)
  end

end
