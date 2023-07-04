defmodule Apicron.Repo.Migrations.CreateData do
  use Ecto.Migration

  def change do
    create table(:scoutdata) do
      add :arc, :string
      add :caDist, :string
      add :dec, :string
      add :elong, :string
      add :geocentricScore, :string
      add :H, :string
      add :ieoScore, :string
      add :lastRun, :string
      add :moid, :string
      add :neo1kmScore, :string
      add :neoScore, :string
      add :nObs, :string
      add :objectName, :string
      add :phaScore, :string
      add :ra, :string
      add :rate, :string
      add :rating, :string
      add :rmsN, :string
      add :tEphem, :string
      add :tisserandScore, :string
      add :unc, :string
      add :uncP1, :string
      add :vInf, :string
      add :Vmag, :string

    end
  end
end
