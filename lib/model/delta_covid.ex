defmodule DeltaCovid do
  @moduledoc """
    Module define struct for deltas
  """
  defstruct active: %{absolute: Integer, pecentage: Integer},
            confirmed: %{absolute: Integer, pecentage: Integer},
            deaths: %{absolute: Integer, pecentage: Integer},
            recovered: %{absolute: Integer, pecentage: Integer}
end
