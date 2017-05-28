defmodule Service do
  @derive [Poison.Encoder]
  defstruct [:address, :port, service: nil]
end

defmodule DiscoveryApi.Repo do
  @service_repo %{"customerapi" => [struct(Service, %{address: "127.0.0.1", port: 5000})]}


  def get(service) do
    if match?(%{^service => _}, @service_repo) do # if the service exits in repo
      @service_repo["#{service}"] |> Enum.shuffle |> hd |> Map.put(:service, service) # return a random instance of the service
    else
      nil
    end
  end

  # def put(service) do
  #   Enum.at(@service_repo["#{service}"], 0)
  # end

end
