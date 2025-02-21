#######################################
# Send a request to ChatGPT with the contents of a Markdown file
# Arguments:
#   markdown_file : The path to the Markdown file.
#   prompt        : (optional) The prompt to use for the OpenAI API request.
#                   Default: "Generate a human-like changelog describing the changes made from the following text".
#   max_tokens    : (optional) The maximum number of tokens for the API response.
#                   Default: 500.
#   model         : (optional) The model to use for text processing.
#                   Default: DEFAULT_MODEL.
# Returns:
#   Generates a response from the OpenAI API based on the contents of the
#   provided Markdown file and the specified (or default) prompt, and saves
#   it in a file with the current date and time in the filename.
#
#   Note: To use this function, you must set the OPENAI_API_KEY global variable.
#######################################
gptsend() {
  local markdown_file="$1"
  local prompt="${2:-Please focus on '## File Changes' and '## Detailed File Changes' to generate a human-like changelog describing the changes made in these sections.}"
  local max_tokens="${3:-4096}"  # Aumentando o limite de tokens
  local model="${4:-gpt-3.5-turbo}"
  local max_lines=2000  

  if [[ -z "${OPENAI_API_KEY}" ]]; then
    echo "OPENAI_API_KEY global variable is not set. Please set your API key and try again."
    return 1 
  fi

  if [[ ! -f "$markdown_file" ]]; then
    echo "File $markdown_file not found or not specified."
    return 1 
  fi

  if ! command -v jq &> /dev/null; then
    echo "The 'jq' command is required but not installed. Please install it and try again."
    return 1 
  fi

  local line_count=$(wc -l < "$markdown_file")
  if (( line_count > max_lines )); then
    echo "Error: The document exceeds the maximum line count of $max_lines lines."
    return 1 
  fi

  local text=$(<"$markdown_file")
  local json_prompt=$(jq -cn --arg text "$text" --arg prompt "$prompt" '{messages: [{role: "user", content: ($prompt + "\n\n" + $text)}]}')

  local api_response=$(curl -s -X POST https://api.openai.com/v1/chat/completions \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $OPENAI_API_KEY" \
      -d "$(echo $json_prompt | jq --arg model "$model" --argjson max_tokens $max_tokens '.model = $model | .max_tokens = $max_tokens')")

  local response_text=$(echo "$api_response" | jq -r '.choices[0].message.content')

  local timestamp=$(date +"%Y%m%d_%H%M%S")
  local output_file="response_$timestamp.md"

  echo -e "$response_text" > "$output_file"
  echo "Response generated and saved in $output_file"
}










