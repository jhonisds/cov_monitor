defmodule CovMonitor.Http.Api do
  @moduledoc """
    Module responsable to call API
  """
  @behaviour CovMonitor.Http

  alias CovMonitor.Adapter, as: Adapter

  def cases_by(country \\ "Brazil") do
    case HTTPoison.get("https://api.covid19api.com/total/dayone/country/#{country}") do
      {:ok, response} ->
        {:ok, parse_json(response) |> Adapter.convert()}

      {:error, reason} ->
        {:error, reason}
    end
  end

  defp parse_json(%{:body => body}) do
    Jason.decode!(body)
  end
end
