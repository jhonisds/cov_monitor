defmodule CurrentCovid do
  @moduledoc """
    Module define structure for current data
  """
  defstruct active: Integer,
            confirmed: Integer,
            deaths: Integer,
            recovered: Integer,
            date: "06/05/2020"
end
