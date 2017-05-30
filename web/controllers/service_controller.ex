defmodule DiscoveryApi.ServiceController do
  use DiscoveryApi.Web, :controller

  def list(conn, _) do
    {status, service} = DiscoveryApi.Repo.list_services()
    json conn_with_status(conn, status), service
  end

  def regions(conn, %{"id" => id}) do
    {status, regions} = DiscoveryApi.Repo.list_regions(id)
    json conn_with_status(conn, status), regions
  end

  def get(conn, %{"id" => id, "reg" => reg}) do
    {status, service} = DiscoveryApi.Repo.get(id, reg)
    json conn_with_status(conn, status), service
  end

  def create(conn, %{"id" => id} = params) do
    service = DiscoveryApi.Service.create(params)
    case DiscoveryApi.Repo.insert(service, id) do
        {:ok, user} -> json conn |> put_status(:created), user
        {:error, _} -> json conn |> put_status(:bad_request), %{errors: ["unable to create service"] }
    end
  end

  defp conn_with_status(conn, :error) do
    conn
      |> put_status(:not_found)
  end

  defp conn_with_status(conn, :ok) do
    conn
      |> put_status(:ok)
  end
end
