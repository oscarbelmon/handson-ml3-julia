using Downloads
using CSV
using DataFrames

DOWLOAD_ROOT = "https://raw.githubusercontent.com/ageron/handson-ml2/master/"
LIFESAT_FOLDER = "datasets/lifesat/"
mkpath(LIFESAT_FOLDER)

for filename in ("oecd_bli_2015.csv", "gdp_per_capita.csv")
    println("Downloading: ", filename)
    url = DOWLOAD_ROOT * LIFESAT_FOLDER * filename
    Downloads.download(url, LIFESAT_FOLDER * filename)
end

oecd_bli = CSV.File(LIFESAT_FOLDER * "oecd_bli_2015.csv") |> DataFrame
gdp_per_capita = CSV.File(LIFESAT_FOLDER * "gdp_per_capita.csv") |> DataFrame

function prepare_country_stats(oecd_bli, gdp_per_capita)
    oecd_bli = oecd_bli[oecd_bli["INEQUALITY"] == "TOT"]
    oecd_bli
end