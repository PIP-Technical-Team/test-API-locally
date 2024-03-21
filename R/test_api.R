
# pak::pak("PIP-Technical-team/pipapi@DEV", ask  = FALSE)
# pak::pak("PIP-Technical-team/wbpip@DEV", ask  = FALSE)

library(pipapi)

if (Sys.info()[["user"]] == "wb384996") {
  force <- TRUE
  if (!"lkups" %in% ls() || isTRUE(force)) {
    data_dir <- Sys.getenv("PIPAPI_DATA_ROOT_FOLDER_LOCAL") |>
      fs::path()
    fs::dir_ls(data_dir, recurse = FALSE)
  }

  lkups <- create_versioned_lkups(data_dir = data_dir,
                                  vintage_pattern = "^20240326")
  start_api(port = 8020)

} else {
  lkups <- pipapi::create_versioned_lkups(Sys.getenv('PIPAPI_DATA_ROOT_FOLDER'))
  start_api(api_version = "v1",
            port = 80,
            host = "0.0.0.0")

}


lkups$versions_paths$`20240326_2017_01_02_PROD`$cache_data_id


ylkup <- create_versioned_lkups(data_dir = "Y:/pip_ingestion_pipeline/pc_data/output-tfs-sync/ITSES-POVERTYSCORE-DATA",
                       vintage_pattern = "^20240326_2017")

lkups$versions_paths$`20240326_2017_01_02_PROD`$cache_data_id |>
  waldo::compare(
ylkup$versions_paths$`20240326_2017_01_02_PROD`$cache_data_id
  )

list(pipapi = packageDescription("pipapi")$GithubSHA1,
     wbpip = packageDescription("wbpip")$GithubSHA1)

