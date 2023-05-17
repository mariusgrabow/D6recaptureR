#' @title recapture
#' @description helps with recaptures
#' @param ring ring_id
#' @return dataframe with +1 observation
#' @details none
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[dplyr]{filter}}, \code{\link[dplyr]{select}}, \code{\link[dplyr]{bind}}
#' @rdname re
#' @export
#' @importFrom dplyr filter select bind_rows
#' @importFrom hms as_hms

re <- function(ring) {

  ring <- deparse(substitute(ring))

  ring <- toupper(ring)


    cmr_filter <- dplyr::filter(cmr,ring_id == ring)%>%
      dplyr::select(date,time,sex,tars_mm,weight_g,blood_infection,infection_type,tag_id)

    print.data.frame(cmr_filter)

    # put in new observation

    new_observation <- cmr[FALSE,]

    new_observation[1,]$time <- hms::as_hms(Sys.time())

    new_observation[1,]$ring_id <- ring

    cmr_added <- dplyr::bind_rows(cmr,new_observation)

    cmr <<- cmr_added

    message("observation was added into global environment. cmr hat 1 more row now")

  }
