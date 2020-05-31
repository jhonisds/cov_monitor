defmodule CovMonitor.Adapter do
  @moduledoc """
    Adapter
  """
  def convert(cases) do
    Enum.map(cases, fn api -> modify(api) end)
  end

  def modify(api) do
    # IO.inspect(api, label: "teste")

    %{
      active: api["Active"],
      confirmed: api["Confirmed"],
      country: api["Country"],
      date: format(api["Date"]),
      deaths: api["Deaths"],
      recovered: api["Recovered"]
    }
  end

  defp format(date) do
    pad = fn num ->
      num
      |> Integer.to_string()
      |> String.pad_leading(2, "0")
    end

    case date |> DateTime.from_iso8601() do
      {:ok, data, _} -> "#{pad.(data.day)}/#{pad.(data.month)}/#{data.year}"
      _ -> "Invalid date"
    end
  end
end
