#######################################
# load variables from .sjon file
# Arguments:
#   file : path to json file.
#
# Returns:
#   0 if running was successful, non-zero on error.
#######################################
function source_json_as_environ() {
  eval "$(jq -r '
  def replace_dot:
    . | gsub("\\."; "_");
  def trim_spaces:
    . | gsub("^[ \t]+|[ \t]+$"; "");
  to_entries|map(
    "export \(.key|trim_spaces|replace_dot)="
    + "\(.value|tostring|trim_spaces|@sh)"
    )|.[]' $@)"
  
  return 0 
}

