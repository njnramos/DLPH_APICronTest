defmodule Apicron.Scoutdata do
  use Ecto.Schema

  schema "scoutdata" do
      field :arc, :string
      field :caDist, :string
      field :dec, :string
      field :elong, :string
      field :geocentricScore, :string
      field :H, :string
      field :ieoScore, :string
      field :lastRun, :string
      field :moid, :string
      field :neo1kmScore, :string
      field :neoScore, :string
      field :nObs, :string
      field :objectName, :string
      field :phaScore, :string
      field :ra, :string
      field :rate, :string
      field :rating, :string
      field :rmsN, :string
      field :tEphem, :string
      field :tisserandScore, :string
      field :unc, :string
      field :uncP1, :string
      field :vInf, :string
      field :Vmag, :string
  end
end
