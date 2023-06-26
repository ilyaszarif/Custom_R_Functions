# An R function to install and load required packages
# The function takes a list, named as "libs", of required packages

install_load_packages <- function(libs) {
  installed_libs <- libs %in% rownames(installed.packages())
  if (any(installed_libs == FALSE)) {
    libs_to_install <- libs[!installed_libs]
    install.packages(libs_to_install, dependencies = TRUE)
  }
  
  invisible(lapply(libs, library, character.only = TRUE))
}

# A working example

libs <- c("here", "tidyverse", "DT", "plotly", "leaflet", "leaflet.extras")
install_load_packages(libs)