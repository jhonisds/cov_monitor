defmodule CovMonitor do
  @moduledoc """
  Documentation for `CovMonitor`.
  """
  require Logger

  alias CovMonitor.Logic

  @api Application.get_env(:cov_monitor, :covapi)
  @cache Application.get_env(:cov_monitor, :covcache)
  @country "brazil"

  @doc """
  url: HTTPoison.get("https://api.covid19api.com/total/dayone/country/brazil")
  """
  def data_covid do
    case get_data() do
      {:error, reason} -> Logger.error(reason)
      {:ok, response} -> response |> Logic.deltas()
    end
  end

  defp get_data do
    case @cache.get(@country) do
      {:ok, nil} -> call_cache()
      {:ok, response} -> {:ok, response}
    end
  end

  defp call_cache do
    case @api.cases_by(@country) do
      {:ok, data} -> {:ok, add_cache(data)}
      {:error, reason} -> {:error, reason}
    end
  end

  defp add_cache(data) do
    @cache.put(@country, data)
    data
  end
end
