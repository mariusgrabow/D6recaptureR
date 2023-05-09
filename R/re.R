re <- function(ring) {

  ring <- deparse(substitute(ring))

  ring <- toupper(ring)

  cmr_filter <- dplyr::filter(cmr,ring_id == ring)


  first_capture <- dplyr::slice_head(cmr_filter,n=1)

  message("First capture:",dplyr::pull(first_capture,date))

  last_capture <- dplyr::slice_tail(cmr_filter,n=1)

  message("Last capture:",dplyr::pull(first_capture,date))

  overall_captures <- nrow(cmr_filter)

  message("\nOverall capture:",overall_captures)

  sex <- dplyr::count(cmr_filter,sex)

  message("\nwas sexed:")

  sex

  blood <- cmr_filter %>%
     group_by(year) %>%
    count(blood_infection)

  message("\nhad_blood_infection:")

  blood

  # put in new observation

  new_observation <- cmr[FALSE,]

  new_observation[1,]$time <- Sys.time()

  new_observation[1,]$ring_id <- ring

  cmr_added <- bind_rows(cmr,new_observation)

  cmr <<- cmr_added


}




