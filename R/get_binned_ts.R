#' Get time-series forecast of binned probability forecast
#'
#' This method does a basic linear interpolation of the raw NWP ensemble.
#' @family ts_training_forecast
#' @param first_valid_time A time stamp
#' @param ens_test [time x member] matrix of ensemble data
#' @param site String, site name
#' @param AC_rating Site's AC power rating
#' @param metadata A data.frame of forecast parameters
#' @return A ts_forecast object
#' @export
get_binned_ts <- function(first_valid_time, ens_test, site, AC_rating, metadata){

  # No Training

  # Forecast
  ts <- forecasting::ts_forecast(ens_test, first_valid_time,
                    time_step=metadata$resolution, scale='site',
                    location=site,
                    method = 'binned',
                    max_power=AC_rating)
  return(ts)
}
