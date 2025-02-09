# from flask import Flask, request, jsonify
# import google.generativeai as genai
# import os
# from flask_cors import CORS
# app = Flask(__name__)
# CORS(app)
# # Configure Gemini API key
# genai.configure(api_key="AIzaSyA7SIGLomunQ39SR2bAxudVl42t5OtpqUU")
# model = genai.GenerativeModel("gemini-1.5-flash")

# @app.route('/generate_question', methods=['POST'])
# def generate_question():
#     try:
#         prompt = (
#             "Create a programming question in Python, Java, or C. "
#             "Include the following:\n"
#             "- A clear problem statement.\n"
#             "- Sample input.\n"
#             "- Expected output.\n"
#             "Structure your response as:\n"
#             "Question: <problem statement>\n"
#             "Sample Input: <input>\n"
#             "Sample Output: <output\n>"
#             "Sample Input: <input>\n"
#             "Sample Output: <output>"
#         )
#         response = model.generate_content(prompt)
#         return jsonify({"question": response.text.strip()}), 200
#     except Exception as e:
#         return jsonify({"error": str(e)}), 500

# @app.route('/evaluate_code', methods=['POST'])
# def evaluate_code():
#     try:
#         data = request.json
#         code = data.get('code', '')
#         language = data.get('language', 'Python')
#         user_input = data.get('input', '')

#         prompt = f"""
#         Evaluate the following {language} code:
        
#         {code}
        
#         Input: {user_input if user_input else "No input provided"}
#         Your response must include:
#         1. Syntax errors (mention line and word causing the error but don't reveal the solution).
#         2. Runtime errors, if any.
#         3. The final output if the code runs successfully.
#         """
#         response = model.generate_content(prompt)
#         return jsonify({"evaluation": response.text.strip()}), 200
#     except Exception as e:
#         return jsonify({"error": str(e)}), 500

# if __name__ == "__main__":
#     app.run(debug=True, host="0.0.0.0", port=5005)



from flask import Flask, request, jsonify
import google.generativeai as genai
import os
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Configure Gemini API key
genai.configure(api_key="AIzaSyA7SIGLomunQ39SR2bAxudVl42t5OtpqUU")
model = genai.GenerativeModel("gemini-1.5-flash")

@app.route('/generate_question', methods=['POST'])
def generate_question():
    try:
        data = request.json
        title = data.get('title', '').lower()

        # Detect language from title
        if 'python' in title:
            language = "Python"
        elif 'java' in title:
            language = "Java"
        elif 'c ' in title or title.endswith('c'):
            language = "C"
        else:
            return jsonify({"error": "Unable to detect programming language from title"}), 400

        prompt = (
            f"Create a programming question in {language}. "
            "Include the following:\n"
            "- A clear problem statement.\n"
            "- Sample input.\n"
            "- Expected output.\n"
            "Structure your response as:\n"
            "Question: <problem statement>\n"
            "Sample Input: <input>\n"
            "Sample Output: <output>\n"
        )
        
        # Logging the prompt to check if it's being sent correctly
        print(f"Generated prompt: {prompt}")
        
        response = model.generate_content(prompt)

        # Check if response is valid
        if not response.text.strip():
            print("Empty response from Gemini model.")
            return jsonify({"error": "Failed to generate question"}), 500

        return jsonify({"question": response.text.strip()}), 200
    except Exception as e:
        # Log the full exception for debugging
        print(f"Error in generate_question: {e}")
        return jsonify({"error": str(e)}), 500

@app.route('/evaluate_code', methods=['POST'])
def evaluate_code():
    try:
        data = request.json
        code = data.get('code', '')
        language = data.get('language', 'Python')
        user_input = data.get('input', '')

        prompt = f"""
        Evaluate the following {language} code:
        
        {code}
        
        Input: {user_input if user_input else "No input provided"}
        Your response must include:
        1. Syntax errors (mention line and word causing the error but don't reveal the solution).
        2. Runtime errors, if any.
        3. The final output if the code runs successfully.
        """
        response = model.generate_content(prompt)
        return jsonify({"evaluation": response.text.strip()}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5005)
