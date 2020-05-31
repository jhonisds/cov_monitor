defmodule Test.Fixtures.Api do
  @moduledoc """
    Module contain sample responses for requests used in tests
  """
  def data_default(map_values, map_api) do
    Map.merge(map_api, map_values)
  end

  def data_api(values), do: data_default(values, data_api())

  def data_api do
    %{
      "Active" => 1,
      "Confirmed" => 1,
      "Country" => "Brazil",
      "Date" => "2020-05-06T00:00:00Z",
      "Deaths" => 1,
      "Recovered" => 1,
      "City" => "",
      "CityCode" => "",
      "CountryCode" => "BR",
      "Lat" => "-14.24",
      "Lon" => "-51.93",
      "Province" => ""
    }
  end

  def data_intern(values), do: data_default(values, data_intern())

  def data_intern do
    %{
      active: 1,
      confirmed: 1,
      country: "Brazil",
      date: "06/05/2020",
      deaths: 1,
      recovered: 1
    }
  end

  def output_list do
    [
      %{
        active: 1,
        confirmed: 2,
        country: "Brazil",
        date: "06/05/2020",
        deaths: 0,
        recovered: 10
      },
      %{
        active: 2,
        confirmed: 2,
        country: "Brazil",
        date: "10/05/2020",
        deaths: 2,
        recovered: 2
      }
    ]
  end

  def entry_list do
    [
      %{
        "Active" => 1,
        "Deaths" => 0,
        "Confirmed" => 2,
        "Recovered" => 10,
        "Date" => "2020-05-06T00:00:00Z",
        "Country" => "Brazil",
        "City" => "",
        "CityCode" => "",
        "CountryCode" => "BR",
        "Lat" => "-14.24",
        "Lon" => "-51.93",
        "Province" => ""
      },
      %{
        "Active" => 2,
        "Deaths" => 2,
        "Confirmed" => 2,
        "Recovered" => 2,
        "Date" => "2020-05-10T00:00:00Z",
        "Country" => "Brazil",
        "City" => "",
        "CityCode" => "",
        "CountryCode" => "BR",
        "Lat" => "-14.24",
        "Lon" => "-51.93",
        "Province" => ""
      }
    ]
  end

  def deltas do
    %DataCovid{
      deltas: %DeltaCovid{
        active: %{percentage: 100, absolute: 1},
        confirmed: %{percentage: 100, absolute: 1},
        deaths: %{percentage: 100, absolute: 1},
        recovered: %{percentage: 100, absolute: 1}
      },
      current: %CurrentCovid{
        confirmed: 2,
        active: 2,
        deaths: 2,
        recovered: 2
      }
    }
  end
end
