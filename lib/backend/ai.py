from dotenv import load_dotenv
import os
import google.generativeai as genai
from flask import Flask, request, jsonify
from flask_cors import CORS

# Step 1: Load environment variables
load_dotenv()

# Step 2: Configure Google Gemini API
genai.configure(api_key=os.getenv("GOOGLE_API_KEY"))

# Step 3: Initialize Flask app
app = Flask(__name__)
CORS(app)  # Enable Cross-Origin Resource Sharing

# Step 4: Initialize Gemini chat model
model = genai.GenerativeModel("gemini-1.5-flash-002")
chat = model.start_chat(history=[])

# Step 5: Define Flask route for handling chat requests
@app.route("/chat", methods=["POST"])
def chat_endpoint():
    data = request.get_json()
    user_message = data.get("message", "")
    if not user_message:
        return jsonify({"error": "Message is required"}), 400

    try:
        # Send message to Gemini and return the response
        response = chat.send_message(user_message, stream=False)
        return jsonify({"response": response.text})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# Step 6: Run the Flask app
if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5002)
