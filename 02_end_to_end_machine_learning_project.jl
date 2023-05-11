using Downloads
using Tar
using GZip
using CSV
using DataFrames

DOWLOAD_ROOT = "https://raw.githubusercontent.com/ageron/handson-ml2/master/";
HOUSING_PATH = "datasets/housing/";
HOUSING_URL = DOWLOAD_ROOT * "datasets/housing/housing.tgz"

function fetchhousingdata(housingurl = HOUSING_URL; housingpath = HOUSING_PATH)
    if ispath(housingpath) == false
        mkdir(housingpath)
    end
    tgz_path = housingpath * "housing.tgz";
    Downloads.download(housingurl, tgz_path);
    # Falta código
    if ispath("./tmp")
        rm("./tmp", recursive = true)
    end
    Tar.extract(GZip.open(housingpath * "housing.tgz"), "./tmp");
    mv("./tmp/housing.csv", housingpath * "housing.csv", force = true);
    rm("./tmp");
end

function loadhousingdata(housingpath = HOUSING_PATH)
    return CSV.File(housingpath * "housing.csv") |> DataFrame
end

fetchhousingdata();
housing = loadhousingdata();
first(housing, 10)