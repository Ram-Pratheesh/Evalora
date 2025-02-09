from flask import Flask, request, jsonify
import google.generativeai as genai
import os
from flask_cors import CORS
import re
import datetime

# Configure Gemini API Key
GEMINI_API_KEY = "AIzaSyCY3gYoNbHa4jaxRXZ_-hBRU4KpZ2e62kg"  # Replace with your actual API key
genai.configure(api_key=GEMINI_API_KEY)
model = genai.GenerativeModel("gemini-1.5-flash")

app = Flask(__name__)
CORS(app)

study_plans = {}

# Endpoint to generate study plan based on user input
@app.route('/generate_study_plan', methods=['POST'])
def generate_study_plan():
    try:
        data = request.json
        subject = data.get('subject', '').lower()
        level = data.get('level', '')
        duration = int(data.get('duration', 1))
        topic = data.get('topic', '')

        if not subject or not level or not duration:
            return jsonify({"error": "All fields except 'Specific Topic' are required!"}), 400

        prompt = f"""
        Create a structured {duration}-week study plan for {subject} at {level} level.
        Ensure topics progress from beginner to advanced within the given duration.
        Each week should build upon previous weeks, ensuring even topic distribution across {duration} weeks.
        Assign detailed topics to each of the 7 days in each week.
        Ensure week titles appear only once and separately from Day 1 content.
        Avoid redundant "Day X" mentions in the same line.
        """

        response = model.generate_content(prompt)

        study_data = response.text.strip().split("\n")
        plan = {}
        
        # Loop through each week and assign topics
        for week in range(1, duration + 1):
            plan[f"Week {week}"] = {"topics": [], "focus": topic if topic else f"{subject} Mastery"}
            
            for day in range(1, 8):  # Loop through 7 days of the week
                topic_index = (week - 1) * 7 + day - 1
                if topic_index < len(study_data):
                    topic_text = study_data[topic_index]
                else:
                    topic_text = "Self Study"  # Fallback text if topic is missing

                topic_text = re.sub(r'^\d+\.', '', topic_text).strip()  # Clean up topic text
                topic_text = topic_text.replace(f"Day {day}:", "").strip()
                topic_text = topic_text.replace(f"Week {week}:", "").strip()
                topic_text = topic_text.lstrip("*# ")

                if not topic_text:
                    topic_text = "Self Study"

                plan[f"Week {week}"]["topics"].append(topic_text)

        study_plans[subject] = {
            "subject": subject,
            "level": level,
            "duration": duration,
            "study_plan": plan,
            "start_date": datetime.date.today()
        }

        return jsonify({"study_plan": plan}), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500

# Run the Flask app
if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5009)