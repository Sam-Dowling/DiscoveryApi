defmodule DiscoveryApi.Service do
  defstruct [:address, :port]

  def create(params \\ :empty) do
    service = %DiscoveryApi.Service{address: params["address"], port: params["port"]}

    unless Enum.any?(Map.from_struct(service), fn {_, v} -> !v end) do
      service
    else
      nil
    end
  end

end
