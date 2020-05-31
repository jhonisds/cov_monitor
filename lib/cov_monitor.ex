defmodule CovMonitor do
  @moduledoc """
  Documentation for `CovMonitor`.
  """
  require Logger

  alias CovMonitor.Logic

  @api Application.get_env(:cov_monitor, :covapi)

  @doc """
  url: HTTPoison.get("https://api.covid19api.com/total/dayone/country/brazil")
  """
  def data_covid do
    case @api.cases_by("Brazil") do
      {:ok, response} ->
        response
        |> Logic.deltas()

      {:error, reason} ->
        Logger.error(reason)
    end
  end
end
