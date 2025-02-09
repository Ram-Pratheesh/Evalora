
# from flask import Flask, request, jsonify
# import os
# from dotenv import load_dotenv
# import google.generativeai as genai
# from collections import defaultdict

# # Load API key and configure the model
# load_dotenv()
# genai.configure(api_key=os.getenv("GOOGLE_API_KEY"))
# model = genai.GenerativeModel("gemini-1.5-flash")

# app = Flask(__name__)

# # MCQ prompt template
# MCQ_PROMPT_TEMPLATE = """\
# Generate exactly {num_questions} multiple-choice questions from the following topic.
# Each question must have exactly 4 options and include the correct answer hidden as metadata at the end of the question block.
# Format each question as follows:

# 1. Question text
# a) Option 1
# b) Option 2
# c) Option 3
# d) Option 4
# Correct: b

# Topic: {topic}

# Details:
# {details}
# """

# # Function to generate a formatted prompt for each topic
# def generate_prompt(topic, details, num_questions):
#     return MCQ_PROMPT_TEMPLATE.format(topic=topic, details=details, num_questions=num_questions)

# # Function to parse MCQs from the response text
# def parse_mcqs(mcq_text):
#     questions = []
#     for q in mcq_text.split("\n\n"):
#         if q.strip():
#             parts = q.split("\n")
#             if len(parts) >= 6:
#                 question = parts[0]
#                 options = [opt.split(") ", 1)[-1] for opt in parts[1:5]]
#                 correct_answer_line = parts[5].strip()
#                 if correct_answer_line.lower().startswith("correct:"):
#                     correct_answer = correct_answer_line.split(":", 1)[-1].strip()
#                     if correct_answer in ["a", "b", "c", "d"]:
#                         questions.append({"question": question, "options": options, "correct": correct_answer})
#     return questions

# # Function to evaluate answers and generate feedback for each topic
# def evaluate_and_generate_feedback(user_answers, mcqs, topic_to_questions):
#     total_score = 0
#     topic_scores = defaultdict(lambda: {"correct": 0, "total": 0})
#     feedback = {}

#     for i, mcq in enumerate(mcqs):
#         selected_answer = user_answers.get(str(i))
#         correct_option = mcq["correct"]
#         topic = next((t for t, qs in topic_to_questions.items() if mcq in qs), None)

#         if topic:
#             topic_scores[topic]["total"] += 1
#             if selected_answer == mcq["options"][ord(correct_option) - ord("a")]:
#                 topic_scores[topic]["correct"] += 1
#                 total_score += 1

#     # Generate feedback for each topic
#     for topic, scores in topic_scores.items():
#         correct, total = scores["correct"], scores["total"]
#         accuracy = (correct / total) * 100 if total > 0 else 0
#         if accuracy >= 85:
#             feedback[topic] = (
#                 f"Excellent performance in this topic! You demonstrated a strong understanding of the material. "
#                 f"Your accuracy of {accuracy:.2f}% suggests you grasped the key concepts well. Keep up the great work "
#                 f"and consider reviewing the advanced topics for further mastery."
#             )
#         elif accuracy >= 50:
#             feedback[topic] = (
#                 f"Good job in this topic with {accuracy:.2f}% accuracy. You understood the material but missed some "
#                 f"important details. Consider reviewing areas where you had difficulty to improve your understanding."
#             )
#         elif accuracy >= 25:
#             feedback[topic] = (
#                 f"Your performance indicates that you need to improve in this topic ({accuracy:.2f}% accuracy). "
#                 f"Revisit the key concepts and practice more to strengthen your understanding."
#             )
#         else:
#             feedback[topic] = (
#                 f"You struggled with this topic, scoring only {accuracy:.2f}% accuracy. "
#                 f"We recommend revisiting the core concepts and practicing more to improve your performance."
#             )

#     return total_score, feedback


# # Function to parse topics and details from the content
# def parse_topics(content):
#     topics = defaultdict(list)
#     current_topic = None
#     lines = content.strip().split("\n")

#     for line in lines:
#         line = line.strip()
#         if not line:
#             continue
#         if line.endswith(":"):  # Detect a topic
#             current_topic = line[:-1].strip()  # Remove the colon and set as current topic
#         elif current_topic:  # Add details to the current topic
#             topics[current_topic].append(line)

#     # Combine the details for each topic into a single string for question generation
#     topics = {topic: " ".join(details) for topic, details in topics.items()}
#     return topics

# @app.route('/generate_mcqs', methods=['POST'])
# def generate_mcqs():
#     data = request.json
#     topic = data.get("topic")
#     details = data.get("details")
#     num_questions = data.get("num_questions", 10)

#     if not topic or not details:
#         return jsonify({"error": "Topic and details are required"}), 400

#     try:
#         prompt = generate_prompt(topic, details, num_questions)
#         response = model.generate_content(prompt)
        
#         # Handle empty or malformed response
#         if not response.text.strip():
#             return jsonify({"error": "No MCQs generated. Please try again."}), 500

#         mcqs = parse_mcqs(response.text)
#         return jsonify({"mcqs": mcqs})
#     except Exception as e:
#         return jsonify({"error": str(e)}), 500

# @app.route('/generate_assessment', methods=['POST'])
# def generate_assessment():
#     data = request.json
#     content = data.get("content")
#     num_questions = data.get("num_questions", 10)

#     if not content:
#         return jsonify({"error": "Content is required"}), 400

#     try:
#         # Parse topics from the content
#         topics = parse_topics(content)
#         total_topics = len(topics)
        
#         if total_topics == 0:
#             return jsonify({"error": "No topics found in the provided content."}), 400

#         questions_per_topic = max(1, num_questions // total_topics)  # Ensure at least 1 question per topic
#         all_questions = []
#         topic_to_questions = defaultdict(list)

#         for topic, details in topics.items():
#             generated_questions = []
#             for attempt in range(3):  # Retry up to 3 times to ensure enough questions
#                 remaining_questions = questions_per_topic - len(generated_questions)
#                 if remaining_questions <= 0:
#                     break
#                 prompt = generate_prompt(topic, details, num_questions=remaining_questions)
#                 response = model.generate_content(prompt)

#                 # Handle empty or malformed response
#                 if not response.text.strip():
#                     continue

#                 new_questions = parse_mcqs(response.text)
#                 generated_questions.extend(new_questions[:remaining_questions])

#             topic_to_questions[topic].extend(generated_questions)
#             all_questions.extend(generated_questions)

#         return jsonify({"mcqs": all_questions, "topic_to_questions": topic_to_questions})
#     except Exception as e:
#         return jsonify({"error": str(e)}), 500

# @app.route('/submit_assessment', methods=['POST'])
# def submit_assessment():
#     data = request.json
#     mcqs = data.get("mcqs")
#     user_answers = data.get("user_answers")
#     topic_to_questions = data.get("topic_to_questions")

#     if not mcqs or not user_answers or not topic_to_questions:
#         return jsonify({"error": "MCQs, user answers, and topic-to-questions mapping are required"}), 400

#     try:
#         total_score, feedback = evaluate_and_generate_feedback(user_answers, mcqs, topic_to_questions)
#         return jsonify({"score": total_score, "feedback": feedback})  # Return feedback for each topic
#     except Exception as e:
#         return jsonify({"error": str(e)}), 500

# @app.route('/test', methods=['GET'])
# def test_connectivity():
#     return jsonify({"message": "MCQ API is working!"})

# if __name__ == "__main__":
#     app.run(debug=True, host="0.0.0.0", port=5003)


# from flask import Flask, request, jsonify
# import os
# from dotenv import load_dotenv
# import google.generativeai as genai
# from collections import defaultdict
# import json
# import random

# # Load API key and configure the model
# load_dotenv()
# genai.configure(api_key=os.getenv("GOOGLE_API_KEY"))
# model = genai.GenerativeModel("gemini-1.5-flash")

# app = Flask(__name__)

# # MCQ prompt template with difficulty tag
# MCQ_PROMPT_TEMPLATE = """\
# Generate exactly {num_questions} multiple-choice questions from the following topic.
# Each question must have exactly 4 options and include the correct answer hidden as metadata at the end of the question block.
# Format each question as follows:

# 1. Question text
# a) Option 1
# b) Option 2
# c) Option 3
# d) Option 4
# Correct: b

# Topic: {topic}

# Difficulty: {difficulty}

# Details:
# {details}
# """

# # Initialize user data storage for tracking difficulty level
# user_data = defaultdict(lambda: {"difficulty_level": "Medium"})

# # Function to generate a formatted prompt for each topic
# def generate_prompt(topic, details, num_questions, difficulty):
#     return MCQ_PROMPT_TEMPLATE.format(topic=topic, details=details, num_questions=num_questions, difficulty=difficulty)

# # Function to parse MCQs from the response text
# def parse_mcqs(mcq_text):
#     questions = []
#     for q in mcq_text.split("\n\n"):
#         if q.strip():
#             parts = q.split("\n")
#             if len(parts) >= 6:
#                 question = parts[0]
#                 options = [opt.split(") ", 1)[-1] for opt in parts[1:5]]
#                 correct_answer_line = parts[5].strip()
#                 if correct_answer_line.lower().startswith("correct:"):
#                     correct_answer = correct_answer_line.split(":", 1)[-1].strip()
#                     if correct_answer in ["a", "b", "c", "d"]:
#                         questions.append({"question": question, "options": options, "correct": correct_answer})
#     return questions

# @app.route('/generate_mcqs', methods=['POST'])
# def generate_mcqs():
#     data = request.json
#     user_id = data.get("user_id")
#     topic = data.get("topic")
#     details = data.get("details")
#     num_questions = data.get("num_questions", 10)
#     difficulty = data.get("difficulty", "Medium")  # Get the difficulty level from the request

#     if not topic or not details:
#         return jsonify({"error": "Topic and details are required"}), 400

#     try:
#         # Generate the prompt with the selected difficulty
#         prompt = generate_prompt(topic, details, num_questions, difficulty)
#         response = model.generate_content(prompt)

#         # Handle empty or malformed response
#         if not response.text.strip():
#             return jsonify({"error": "No MCQs generated. Please try again."}), 500

#         mcqs = parse_mcqs(response.text)
#         # Randomize and make sure questions are unique
#         random.shuffle(mcqs)  # Randomize questions
#         unique_mcqs = []
#         seen_questions = set()
#         for mcq in mcqs:
#             if mcq["question"] not in seen_questions:
#                 unique_mcqs.append(mcq)
#                 seen_questions.add(mcq["question"])

#         return jsonify({"mcqs": unique_mcqs})
#     except Exception as e:
#         return jsonify({"error": str(e)}), 500

# @app.route('/test', methods=['GET'])
# def test_connectivity():
#     return jsonify({"message": "MCQ API is working!"})

# if __name__ == "__main__":
#     app.run(debug=True, host="0.0.0.0", port=5003)


#

# from flask import Flask, request, jsonify
# import os
# from dotenv import load_dotenv
# import google.generativeai as genai
# from collections import defaultdict
# import json
# import random

# # Load API key and configure the model
# load_dotenv()
# genai.configure(api_key=os.getenv("GOOGLE_API_KEY"))
# model = genai.GenerativeModel("gemini-1.5-flash")

# app = Flask(__name__)

# # MCQ prompt template with difficulty tag
# MCQ_PROMPT_TEMPLATE = """\
# Generate exactly {num_questions} multiple-choice questions from the following topic.
# Each question must have exactly 4 options and include the correct answer hidden as metadata at the end of the question block.
# The questions should be ordered:

# Question text
# a) Option 1
# b) Option 2
# c) Option 3
# d) Option 4
# Correct: b

# Topic: {topic}

# Difficulty: {difficulty}

# Details:
# {details}
# """

# # Initialize user data storage for tracking difficulty level
# user_data = defaultdict(lambda: {"difficulty_level": "Medium"})

# # Function to generate a formatted prompt for each topic
# def generate_prompt(topic, details, num_questions, difficulty):
#     return MCQ_PROMPT_TEMPLATE.format(topic=topic, details=details, num_questions=num_questions, difficulty=difficulty)

# # Function to parse MCQs from the response text
# def parse_mcqs(mcq_text):
#     questions = []
#     question_number = 1
#     for q in mcq_text.split("\n\n"):
#         if q.strip():
#             parts = q.split("\n")
#             if len(parts) >= 6:
#                 question = parts[0]
#                 options = [opt.split(") ", 1)[-1] for opt in parts[1:5]]
#                 correct_answer_line = parts[5].strip()
#                 if correct_answer_line.lower().startswith("correct:"):
#                     correct_answer = correct_answer_line.split(":", 1)[-1].strip()
#                     if correct_answer in ["a", "b", "c", "d"]:
#                         questions.append({
#                             "question": question,
#                             "options": options,
#                             "correct": correct_answer
#                         })
#                         question_number += 1

#     # Sort questions by the generated serial number (1, 2, 3, ...)
#     for index, question in enumerate(questions):
#         question["serial_number"] = index + 1  # Serial number starts from 1 and increments

#     return questions


# @app.route('/generate_mcqs', methods=['POST'])
# def generate_mcqs():
#     data = request.json
#     user_id = data.get("user_id")
#     topic = data.get("topic")
#     details = data.get("details")
#     num_questions = data.get("num_questions", 10)
#     difficulty = data.get("difficulty", "Medium")  # Get the difficulty level from the request

#     if not topic or not details:
#         return jsonify({"error": "Topic and details are required"}), 400

#     try:
#         # Adjust difficulty text based on user selection
#         difficulty_map = {
#             "Easy": "Generate simple and basic questions suitable for beginners with basic understanding of the topic.",
#             "Medium": "Generate questions with an intermediate level of complexity, suitable for users with a good understanding of the topic.",
#             "Hard": "Generate tough questions with complex concepts, suitable for advanced learners with deep understanding of the topic."
#         }
        
#         # Generate the prompt with the selected difficulty
#         prompt = generate_prompt(topic, details, num_questions, difficulty_map.get(difficulty, "Medium"))
#         response = model.generate_content(prompt)

#         # Handle empty or malformed response
#         if not response.text.strip():
#             return jsonify({"error": "No MCQs generated. Please try again."}), 500

#         mcqs = parse_mcqs(response.text)
        
#         # Randomize and make sure questions are unique
#         random.shuffle(mcqs)  # Randomize questions
#         unique_mcqs = []
#         seen_questions = set()
#         for mcq in mcqs:
#             if mcq["question"] not in seen_questions:
#                 unique_mcqs.append(mcq)
#                 seen_questions.add(mcq["question"])

#         # Sort the questions by the serial number to ensure they are in order
#         unique_mcqs.sort(key=lambda x: x["serial_number"])

#         return jsonify({"mcqs": unique_mcqs})
#     except Exception as e:
#         return jsonify({"error": str(e)}), 500

# @app.route('/test', methods=['GET'])
# def test_connectivity():
#     return jsonify({"message": "MCQ API is working!"})

# if __name__ == "__main__":
#     app.run(debug=True, host="0.0.0.0", port=5003)


from flask import Flask, request, jsonify
import os
from dotenv import load_dotenv
import google.generativeai as genai
from collections import defaultdict
import json
import random

# Load API key and configure the model
load_dotenv()
genai.configure(api_key=os.getenv("GOOGLE_API_KEY"))
model = genai.GenerativeModel("gemini-1.5-flash")

app = Flask(__name__)

# MCQ prompt template with difficulty tag
MCQ_PROMPT_TEMPLATE = """
Generate exactly {num_questions} multiple-choice questions from the following topic.
Each question must have exactly 4 options and include the correct answer hidden as metadata at the end of the question block.
The questions should be ordered:

Question text
a) Option 1
b) Option 2
c) Option 3
d) Option 4
Correct: b

Topic: {topic}

Difficulty: {difficulty}

Details:
{details}
"""

# Initialize user data storage for tracking difficulty level and performance
user_data = defaultdict(lambda: {"difficulty_level": "Medium", "correct_answers": 0, "total_attempts": 0})

def generate_prompt(topic, details, num_questions, difficulty):
    return MCQ_PROMPT_TEMPLATE.format(topic=topic, details=details, num_questions=num_questions, difficulty=difficulty)


def parse_mcqs(mcq_text):
    questions = []
    for q in mcq_text.split("\n\n"):
        if q.strip():
            parts = q.split("\n")
            if len(parts) >= 6:
                question = parts[0]
                options = [opt.split(") ", 1)[-1] for opt in parts[1:5]]
                correct_answer_line = parts[5].strip()
                if correct_answer_line.lower().startswith("correct:"):
                    correct_answer = correct_answer_line.split(":", 1)[-1].strip()
                    if correct_answer in ["a", "b", "c", "d"]:
                        questions.append({
                            "question": question,
                            "options": options,
                            "correct": correct_answer
                        })
    return questions


@app.route('/generate_mcqs', methods=['POST'])
def generate_mcqs():
    data = request.json
    user_id = data.get("user_id")
    topic = data.get("topic")
    details = data.get("details")
    num_questions = data.get("num_questions", 10)
    
    if not topic or not details:
        return jsonify({"error": "Topic and details are required"}), 400
    
    # Retrieve user difficulty level
    difficulty = user_data[user_id]["difficulty_level"]
    
    difficulty_map = {
        "Easy": "Generate simple and basic questions suitable for beginners with basic understanding of the topic.",
        "Medium": "Generate questions with an intermediate level of complexity, suitable for users with a good understanding of the topic.",
        "Hard": "Generate tough questions with complex concepts, suitable for advanced learners with deep understanding of the topic."
    }
    
    prompt = generate_prompt(topic, details, num_questions, difficulty_map[difficulty])
    response = model.generate_content(prompt)
    
    if not response.text.strip():
        return jsonify({"error": "No MCQs generated. Please try again."}), 500
    
    mcqs = parse_mcqs(response.text)
    
    # Shuffle and return unique questions
    random.shuffle(mcqs)
    unique_mcqs = []
    seen_questions = set()
    for mcq in mcqs:
        if mcq["question"] not in seen_questions:
            unique_mcqs.append(mcq)
            seen_questions.add(mcq["question"])
    
    return jsonify({"mcqs": unique_mcqs})


@app.route('/submit_assessment', methods=['POST'])
def submit_assessment():
    data = request.json
    user_id = data.get("user_id")
    mcqs = data.get("mcqs")
    user_answers = data.get("user_answers")
    
    if not mcqs or not user_answers or not user_id:
        return jsonify({"error": "MCQs, user answers, and user ID are required"}), 400
    
    correct_count = 0
    total_questions = len(mcqs)
    
    for i, mcq in enumerate(mcqs):
        selected_answer = user_answers.get(str(i))
        correct_option = mcq["correct"]
        
        if selected_answer == mcq["options"][ord(correct_option) - ord("a")]:
            correct_count += 1
    
    accuracy = (correct_count / total_questions) * 100
    
    # Update user history
    user_data[user_id]["correct_answers"] += correct_count
    user_data[user_id]["total_attempts"] += total_questions
    
    # Adjust difficulty based on performance
    if accuracy >= 85:
        user_data[user_id]["difficulty_level"] = "Hard"
    elif accuracy >= 50:
        user_data[user_id]["difficulty_level"] = "Medium"
    else:
        user_data[user_id]["difficulty_level"] = "Easy"
    
    feedback = {
        "accuracy": accuracy,
        "new_difficulty": user_data[user_id]["difficulty_level"],
        "message": (
            "Great job! Difficulty level increased." if accuracy >= 85 else
            "Keep going! Your difficulty remains the same." if accuracy >= 50 else
            "You might need some revision. Difficulty level decreased."
        )
    }
    
    return jsonify(feedback)


@app.route('/test', methods=['GET'])
def test_connectivity():
    return jsonify({"message": "MCQ API is working!"})


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5003)
