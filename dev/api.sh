export OPENAI_API_KEY="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"
curl -s -X POST https://api.openai.com/v1/chat/completions \ -H "Content-Type: application/json" \ -H "Authorization: Bearer $OPENAI_API_KEY" \ -d '{ "model": "gpt-3.5-turbo", "messages": [{"role": "user", "content": "Hello, who won the world cup in 2022?"}], "max_tokens": 50 }'
