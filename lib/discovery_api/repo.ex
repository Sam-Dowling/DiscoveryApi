defmodule DiscoveryApi.Repo do

  def list_services() do
    Cachex.keys(:services)
  end

  def list_regions(id) do
    {status, services} = Cachex.get(:services, id) # get all instances of service :id
    if (status == :ok) do
      regions = Enum.map(services, fn instance -> Map.get(instance, :region) end)
        |> Enum.uniq
      {:ok, regions}
    else
      {:error, []}
    end
  end

  def get(id, reg) do
    {status_r, regions} = list_regions(id)
    if (status_r == :ok) do
      {status_s, services} = Cachex.get(:services, id)
      service =
        case {status_s, Enum.member?(regions, reg)} do
          {:ok, true} -> Enum.filter(services, fn instance -> Map.get(instance, :region) == reg end)
          {_,_} -> services
        end
        
      {:ok, service |> Enum.shuffle |> hd}
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
