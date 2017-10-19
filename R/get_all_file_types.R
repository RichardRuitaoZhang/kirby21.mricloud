#' @title Get all file types in the Kirby21.mricloud Package
#'
#' @description Return the file types for the people scanned available in the 
#' kirby21.mricloud package
#' @return Vector of character types
#' 
#' @export
get_all_file_types = function(){
  file_types <- c("cor", "DTI_MA", "volumes_MNI", "volumes_corrected", "z_cor", "tc")
  return(file_types)
}