#' @title Get Kirby21.mricloud Text Filenames in a data.frame
#'
#' @description Return a data.frame of filenames for the correlation text files
#' @param ids ID to return
#' @param visits Vector of scan indices to return (1 or 2 or both)
#' @param file_types Vector of file types to return 
#' \code{c("cor", "DTI_MA", "volumes_MNI", "volumes_corrected", "z_cor", "tc")}
#' @export
get_txt_filenames = function(
  ids = get_ids(),
  visits = c(1,2),
  file_types = get_all_file_types()
){
  name_association = c("cor" = "cor.txt", "DTI_MA" = "DTI_MA.csv", "volumes_MNI" = "kirby_3_1_ax_283Labels_M2_MNI_stats.txt", "volumes_corrected" = "kirby_3_1_ax_283Labels_M2_corrected_stats.txt", "z_cor" = "z_cor.txt", "tc" = "tc.txt")
  
  package_path = system.file(package='kirby21.mricloud')
  subject_ids = c(outer(visits,ids, paste, sep="/"))
  fnames = c(outer(subject_ids,file_types, paste, sep="/"))
  
  df = data.frame(filename = fnames, stringsAsFactors = FALSE)
  split_name = strsplit(df$filename, "/")
  df$Subject_ID = sapply(split_name, function(x) x[2])
  df$visit = sapply(split_name, function(x) x[1])
  df$filename = sapply(split_name, function(x) name_association[[x[3]]])
  df$filename = file.path(system.file(package = "kirby21.mricloud"),paste0("visit_", df$visit), df$Subject_ID, df$filename)
  return(df)
}