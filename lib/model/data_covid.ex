defmodule DataCovid do
  @moduledoc """
    Module define structre for covid
  """
  defstruct deltas: %DeltaCovid{}, current: %CurrentCovid{}
end
