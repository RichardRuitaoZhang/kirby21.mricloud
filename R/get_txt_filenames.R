#' @title Get Kirby21.mricloud Text Filenames in a data.frame
#'
#' @description Return a data.frame of filenames for the correlation text files
#' @param ids ID to return
#' @param visits Vector of scan indices to return (1 or 2 or both)
#' @param file_types Vector of file types to return 
#' \code{c("cor", "DTI_MA", "volumes_MNI", "volumes_corrected", "z_cor", "tc")}
#' @importFrom readr read_csv
#' @export
get_txt_filenames = function(
  ids = get_ids(),
  visits = c(1,2),
  file_types = get_all_file_types()
){
  name_association = c("cor" = "cor.txt", "DTI_MA" = "DTI_MA.csv", "volumes_MNI" = "kirby_3_1_ax_283Labels_M2_MNI_stats.txt", "volumes_corrected" = "kirby_3_1_ax_283Labels_M2_corrected_stats.txt", "z_cor" = "z_cor.txt", "tc" = "tc.txt")
  selected_file_types = subset(name_association, names(name_association) %in% file_types)

  df = expand.grid(Subject_ID = ids, visit = visits, filename = selected_file_types,stringsAsFactors = FALSE)
  df$filename = file.path(system.file(package = "kirby21.mricloud"),paste0("visit_", df$visit), df$Subject_ID, df$filename)
  return(df)
}