defmodule DiscoveryApi.Repo do

  def all() do
    Cachex.keys(:services)
  end

  def get(id) do
    {status, services} = Cachex.get(:services, id)
    if (status == :ok) do
      service = services |> Enum.shuffle |> hd
      {:ok, service}
    else
      {:error, []}
    end
  end


  def insert(service, id) do
    if service do
      {status, services} = Cachex.get(:services, id)
      services = if (status == :ok), do: [service | services], else: [service]
      Cachex.set(:services, id, services)
      {:ok, service}
    else
      {:error, nil}
    end
  end

end
