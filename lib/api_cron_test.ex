defmodule Apicrontest.Application do
  use GenServer
  use Flow


  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_work() # Schedule work to be performed at some point
    {:ok, state}
  end

  def handle_info(:work, state) do
    IO.puts("Start Task...")
    get_insert() # TASK
    IO.puts("Task Finished...")
    IO.puts("waiting...")
    schedule_work() # Reschedule once more
    {:noreply, state}
  end

  defp schedule_work() do
    Process.send_after(self(), :work, 600000) # In 10mins
  end







  # Get Data and Insert to DB
  def get_insert do

    for datarow <- get_apicron() do
        dataitem = %Apicron.Scoutdata{
          arc: to_string(datarow["arc"]),
          caDist: to_string(datarow["caDist"]),
          dec: to_string(datarow["dec"]),
          elong: to_string(datarow["elong"]),
          geocentricScore: to_string(datarow["geocentricScore"]),
          H: to_string(datarow["H"]),
          ieoScore: to_string(datarow["ieoScore"]),
          lastRun: to_string(datarow["lastRun"]),
          moid: to_string(datarow["moid"]),
          neo1kmScore: to_string(datarow["neo1kmScore"]),
          neoScore: to_string(datarow["neoScore"]),
          nObs: to_string(datarow["nObs"]),
          objectName: to_string(datarow["objectName"]),
          phaScore: to_string(datarow["phaScore"]),
          ra: to_string(datarow["ra"]),
          rate: to_string(datarow["rate"]),
          rating: to_string(datarow["rating"]),
          rmsN: to_string(datarow["rmsN"]),
          tEphem: to_string(datarow["tEphem"]),
          tisserandScore: to_string(datarow["tisserandScore"]),
          unc: to_string(datarow["unc"]),
          uncP1: to_string(datarow["uncP1"]),
          vInf: to_string(datarow["vInf"]),
          Vmag: to_string(datarow["Vmag"])
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



  #Scheduler =====================




end
