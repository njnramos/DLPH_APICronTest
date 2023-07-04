defmodule ApiCronTest do
  use Flow

  def get_insert do


    # Enum.each(get_apicron(), &IO.inspect/1)

    # for x <- get_apicron() do
    #   IO.inspect(x)
    #   IO.puts("--------")
    # end

    for datarow <- get_apicron() do
        dataitem = %Apicron.Scoutdata{
          arc: datarow["arc"],
          caDist: datarow["caDist"],
          dec: datarow["dec"],
          elong: datarow["elong"],
          geocentricScore: datarow["geocentricScore"],
          H: datarow["H"],
          ieoScore: datarow["ieoScore"],
          lastRun: datarow["lastRun"],
          moid: datarow["moid"],
          neo1kmScore: datarow["neo1kmScore"],
          neoScore: datarow["neoScore"],
          nObs: datarow["nObs"],
          objectName: datarow["objectName"],
          phaScore: datarow["phaScore"],
          ra: datarow["ra"],
          rate: datarow["rate"],
          rating: datarow["rating"],
          rmsN: datarow["rmsN"],
          tEphem: datarow["tEphem"],
          tisserandScore: datarow["tisserandScore"],
          unc: datarow["unc"],
          uncP1: datarow["uncP1"],
          vInf: datarow["vInf"],
          Vmag: datarow["Vmag"]
        }

        Apicron.Repo.insert(dataitem)
    end

  end

  def get_apicron do
    data = extract_apicron_data("https://ssd-api.jpl.nasa.gov/scout.api")
  end

  defp extract_apicron_data(url) do
    extracted_data =
      HTTPoison.get!(url)
      |> Map.get(:body)
      |> Poison.decode!()
      |> Map.get("data")
      |> Flow.from_enumerable()
  end


end
