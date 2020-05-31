defmodule CovMonitor.Logic do
  @moduledoc """
    Module for logic
  """
  def deltas([]), do: %{}

  def deltas(data_covid) do
    first = data_covid |> Enum.take(-7) |> List.first()
    current = List.last(data_covid)

    %DataCovid{
      deltas: %DeltaCovid{
        active: delta_info(first[:active], current[:active]),
        confirmed: delta_info(first[:confirmed], current[:confirmed]),
        deaths: delta_info(first[:deaths], current[:deaths]),
        recovered: delta_info(first[:recovered], current[:recovered])
      },
      current: %CurrentCovid{
        confirmed: current[:confirmed],
        active: current[:active],
        deaths: current[:deaths],
        recovered: current[:recovered],
        date: current[:date]
      }
    }
  end

  defp delta_info(first, current) do
    %{
      percentage: delta_relative(first, current),
      absolute: delta_absolute(first, current)
    }
  end

  defp delta_relative(first, current) do
    (delta_absolute(first, current) / first * 100) |> trunc
  end

  defp delta_absolute(first, current), do: current - first
end
