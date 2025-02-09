# from flask import Flask, request, jsonify
# from sklearn.feature_extraction.text import TfidfVectorizer
# from sklearn.metrics.pairwise import cosine_similarity
# import pandas as pd
# import os

# app = Flask(__name__)

# # Path to the dataset
# dataset_path = os.path.join(os.path.dirname(__file__), "Coursera.csv")

# # Load dataset with URLs
# if not os.path.exists(dataset_path):
#     raise FileNotFoundError(f"Dataset not found at {dataset_path}")
# data = pd.read_csv(dataset_path)

# # Standardize column names to lowercase and replace spaces with underscores
# data.columns = [col.lower().replace(" ", "_") for col in data.columns]

# # Convert 'course_rating' to numeric, removing rows with non-numeric entries
# data["course_rating"] = pd.to_numeric(data["course_rating"], errors="coerce")
# data = data.dropna(subset=["course_rating"])

# # Content-Based Filtering Model using TF-IDF on Course Descriptions
# def content_based_recommendation(skill_input, n_recommendations=5):
#     # TF-IDF vectorization
#     tfidf = TfidfVectorizer(stop_words="english")
#     tfidf_matrix = tfidf.fit_transform(data["course_description"])

#     # Transform user input into TF-IDF space
#     skill_input_tfidf = tfidf.transform([skill_input])

#     # Calculate cosine similarity
#     cosine_similarities = cosine_similarity(skill_input_tfidf, tfidf_matrix).flatten()
#     recommended_courses_indices = cosine_similarities.argsort()[-n_recommendations:][::-1]

#     # Fetch the recommendations
#     recommendations = data.iloc[recommended_courses_indices][
#         ["course_name", "course_description", "course_rating", "course_url"]
#     ]
#     return recommendations

# # API endpoint to get recommendations
# @app.route("/recommendations", methods=["GET"])
# def get_recommendations():
#     # Get the 'skills' parameter from the request
#     user_skill_input = request.args.get("skills", "").strip()
#     if not user_skill_input:
#         return jsonify({"error": "Skills parameter is required"}), 400

#     try:
#         # Generate recommendations
#         recommendations = content_based_recommendation(user_skill_input)
#         recommendations_list = recommendations.to_dict(orient="records")
#         return jsonify(recommendations_list), 200
#     except Exception as e:
#         return jsonify({"error": str(e)}), 500

# # Run the Flask app
# if __name__ == "__main__":
#     app.run(debug=True, host="0.0.0.0", port=5000)



#test 2

# from flask import Flask, request, jsonify
# from sklearn.feature_extraction.text import TfidfVectorizer
# from sklearn.metrics.pairwise import cosine_similarity
# import pandas as pd
# import os
# import random
# from pymongo import MongoClient

# app = Flask(__name__)

# # Path to the dataset
# dataset_path = os.path.join(os.path.dirname(__file__), "Coursera.csv")

# # Load dataset with URLs
# if not os.path.exists(dataset_path):
#     raise FileNotFoundError(f"Dataset not found at {dataset_path}")
# data = pd.read_csv(dataset_path)

# # Standardize column names to lowercase and replace spaces with underscores
# data.columns = [col.lower().replace(" ", "_") for col in data.columns]

# # Convert 'course_rating' to numeric, removing rows with non-numeric entries
# data["course_rating"] = pd.to_numeric(data["course_rating"], errors="coerce")
# data = data.dropna(subset=["course_rating"])

# # MongoDB connection
# mongo_uri = "mongodb+srv://230701028:anan%400712@coderaiders.6j15f.mongodb.net/Evalora?retryWrites=true&w=majority"
# client = MongoClient(mongo_uri)
# db = client["Evalora"]
# users_collection = db["users"]

# # Content-Based Filtering Model using TF-IDF on Course Descriptions
# def content_based_recommendation(skill_input, n_recommendations=5):
#     # TF-IDF vectorization
#     tfidf = TfidfVectorizer(stop_words="english")
#     tfidf_matrix = tfidf.fit_transform(data["course_description"])

#     # Transform user input into TF-IDF space
#     skill_input_tfidf = tfidf.transform([skill_input])

#     # Calculate cosine similarity
#     cosine_similarities = cosine_similarity(skill_input_tfidf, tfidf_matrix).flatten()
#     recommended_courses_indices = cosine_similarities.argsort()[-n_recommendations:][::-1]

#     # Fetch the recommendations
#     recommendations = data.iloc[recommended_courses_indices][
#         ["course_name", "course_description", "course_rating", "course_url"]
#     ]
#     return recommendations

# # API endpoint to generate recommendations
# @app.route("/generate-recommendations", methods=["POST"])
# def generate_recommendations():
#     try:
#         # Get the email from the request
#         email = request.json.get("email")
#         if not email:
#             return jsonify({"error": "Email is required"}), 400

#         # Fetch the user's selectedItems list from MongoDB
#         user = users_collection.find_one({"email": email})
#         if not user:
#             return jsonify({"error": "User not found"}), 404

#         selected_items = user.get("selectedItems", [])
#         if not selected_items:
#             return jsonify({"error": "No preferences found for the user"}), 400

#         # Randomly select one skill from the list
#         random_skill = random.choice(selected_items)

#         # Generate recommendations using the content-based recommendation function
#         recommendations = content_based_recommendation(random_skill)
#         recommendations_list = recommendations.to_dict(orient="records")

#         # Print recommendations to the console
#         print(f"Selected skill: {random_skill}")
#         print("Generated Recommendations:")
#         for rec in recommendations_list:
#             print(rec)

#         return jsonify({
#             "message": "Recommendations generated successfully",
#             "selected_skill": random_skill,
#             "recommendations": recommendations_list,
#         }), 200

#     except Exception as e:
#         return jsonify({"error": str(e)}), 500

# # Run the Flask app
# if __name__ == "__main__":
#     app.run(debug=True, host="0.0.0.0", port=5001)  # Use a different port to avoid conflict with app.js




#test 3

# from flask import Flask, request, jsonify
# from sklearn.feature_extraction.text import TfidfVectorizer
# from sklearn.metrics.pairwise import cosine_similarity
# import pandas as pd
# import os
# import random
# from pymongo import MongoClient
# from flask_cors import CORS

# app = Flask(__name__)
# CORS(app)  # Allow cross-origin requests

# # Path to the dataset
# dataset_path = os.path.join(os.path.dirname(__file__), "Coursera.csv")

# # Load dataset with URLs
# if not os.path.exists(dataset_path):
#     raise FileNotFoundError(f"Dataset not found at {dataset_path}")
# data = pd.read_csv(dataset_path)

# # Standardize column names to lowercase and replace spaces with underscores
# data.columns = [col.lower().replace(" ", "_") for col in data.columns]
# data["course_rating"] = pd.to_numeric(data["course_rating"], errors="coerce")
# data = data.dropna(subset=["course_rating"])

# # MongoDB connection
# mongo_uri = "mongodb+srv://230701028:anan%400712@coderaiders.6j15f.mongodb.net/Evalora?retryWrites=true&w=majority"
# client = MongoClient(mongo_uri)
# db = client["Evalora"]
# users_collection = db["users"]

# # Content-Based Filtering Model using TF-IDF on Course Descriptions
# def content_based_recommendation(skill_input, n_recommendations=5):
#     tfidf = TfidfVectorizer(stop_words="english")
#     tfidf_matrix = tfidf.fit_transform(data["course_description"])
#     skill_tfidf = tfidf.transform([skill_input])
#     cosine_similarities = cosine_similarity(skill_tfidf, tfidf_matrix).flatten()
#     recommended_courses_indices = cosine_similarities.argsort()[-n_recommendations:][::-1]
#     recommendations = data.iloc[recommended_courses_indices][
#         ["course_name", "course_description", "course_rating", "course_url"]
#     ]
#     return recommendations

# # API endpoint to generate recommendations
# @app.route("/generate-recommendations", methods=["POST"])
# def generate_recommendations():
#     try:
#         email = request.json.get("email")
#         if not email:
#             return jsonify({"error": "Email is required"}), 400

#         user = users_collection.find_one({"email": email})
#         if not user:
#             return jsonify({"error": "User not found"}), 404

#         selected_items = user.get("selectedItems", [])
#         if not selected_items:
#             return jsonify({"error": "No preferences found for the user"}), 400

#         random_skill = random.choice(selected_items)
#         recommendations = content_based_recommendation(random_skill)
#         recommendations_list = recommendations.to_dict(orient="records")

#         print(f"Selected skill: {random_skill}")
#         print("Generated Recommendations:")
#         for rec in recommendations_list:
#             print(rec)

#         return jsonify({
#             "message": "Recommendations generated successfully",
#             "selected_skill": random_skill,
#             "recommendations": recommendations_list,
#         }), 200

#     except Exception as e:
#         return jsonify({"error": str(e)}), 500

# # Run the Flask app
# if __name__ == "__main__":
#     app.run(debug=True, host="0.0.0.0", port=5001)



#test 4 

# from flask import Flask, request, jsonify
# from sklearn.feature_extraction.text import TfidfVectorizer
# from sklearn.metrics.pairwise import cosine_similarity
# import pandas as pd
# import os
# import random
# from pymongo import MongoClient

# app = Flask(__name__)

# # Path to the dataset
# dataset_path = os.path.join(os.path.dirname(__file__), "Coursera.csv")

# # Load dataset with URLs
# if not os.path.exists(dataset_path):
#     raise FileNotFoundError(f"Dataset not found at {dataset_path}")
# data = pd.read_csv(dataset_path)

# # Standardize column names to lowercase and replace spaces with underscores
# data.columns = [col.lower().replace(" ", "_") for col in data.columns]

# # Convert 'course_rating' to numeric, removing rows with non-numeric entries
# data["course_rating"] = pd.to_numeric(data["course_rating"], errors="coerce")
# data = data.dropna(subset=["course_rating"])

# # MongoDB connection
# mongo_uri = "mongodb+srv://230701028:anan%400712@coderaiders.6j15f.mongodb.net/Evalora?retryWrites=true&w=majority"
# client = MongoClient(mongo_uri)
# db = client["Evalora"]
# users_collection = db["users"]

# # Content-Based Filtering Model using TF-IDF on Course Descriptions
# def content_based_recommendation(skill_input, n_recommendations=5):
#     # TF-IDF vectorization
#     tfidf = TfidfVectorizer(stop_words="english")
#     tfidf_matrix = tfidf.fit_transform(data["course_description"])

#     # Transform user input into TF-IDF space
#     skill_input_tfidf = tfidf.transform([skill_input])

#     # Calculate cosine similarity
#     cosine_similarities = cosine_similarity(skill_input_tfidf, tfidf_matrix).flatten()
#     recommended_courses_indices = cosine_similarities.argsort()[-n_recommendations:][::-1]

#     # Fetch the recommendations
#     recommendations = data.iloc[recommended_courses_indices][
#         ["course_name", "course_description", "course_rating", "course_url"]
#     ]
#     return recommendations

# # API endpoint to generate recommendations
# @app.route("/generate-recommendations", methods=["POST"])
# def generate_recommendations():
#     try:
#         # Get the email from the request
#         email = request.json.get("email")
#         if not email:
#             return jsonify({"error": "Email is required"}), 400

#         # Fetch the user's selectedItems list from MongoDB
#         user = users_collection.find_one({"email": email})
#         if not user:
#             return jsonify({"error": "User not found"}), 404

#         selected_items = user.get("selectedItems", [])
#         if not selected_items:
#             return jsonify({"error": "No preferences found for the user"}), 400

#         # Shuffle the skills to ensure randomness
#         random.shuffle(selected_items)

#         # Randomly select one skill from the shuffled list
#         random_skill = random.choice(selected_items)

#         # Generate recommendations using the content-based recommendation function
#         recommendations = content_based_recommendation(random_skill)
#         recommendations_list = recommendations.to_dict(orient="records")

#         # Print recommendations to the console
#         print(f"Selected skill: {random_skill}")
#         print("Generated Recommendations:")
#         for rec in recommendations_list:
#             print(rec)

#         return jsonify({
#             "message": "Recommendations generated successfully",
#             "selected_skill": random_skill,
#             "recommendations": recommendations_list,
#         }), 200

#     except Exception as e:
#         return jsonify({"error": str(e)}), 500

# # Run the Flask app
# if __name__ == "__main__":
#     app.run(debug=True, host="0.0.0.0", port=5001)  # Use a different port to avoid conflict with app.js




#test 5 pass
# from flask import Flask, request, jsonify
# from sklearn.feature_extraction.text import TfidfVectorizer
# from sklearn.metrics.pairwise import cosine_similarity
# import pandas as pd
# import os
# import random
# from pymongo import MongoClient

# app = Flask(__name__)

# # Path to the dataset
# dataset_path = os.path.join(os.path.dirname(__file__), "new.csv")

# # Load dataset with URLs
# if not os.path.exists(dataset_path):
#     raise FileNotFoundError(f"Dataset not found at {dataset_path}")
# data = pd.read_csv(dataset_path)

# # Standardize column names to lowercase and replace spaces with underscores
# data.columns = [col.lower().replace(" ", "_") for col in data.columns]

# # Convert 'course_rating' to numeric, removing rows with non-numeric entries
# data["course_rating"] = pd.to_numeric(data["course_rating"], errors="coerce")
# data = data.dropna(subset=["course_rating"])

# # MongoDB connection
# mongo_uri = "mongodb+srv://230701028:anan%400712@coderaiders.6j15f.mongodb.net/Evalora?retryWrites=true&w=majority"
# client = MongoClient(mongo_uri)
# db = client["Evalora"]
# users_collection = db["users"]

# # Content-Based Filtering Model using TF-IDF on Course Descriptions
# def content_based_recommendation(skill_input, n_recommendations=5):
#     # TF-IDF vectorization
#     tfidf = TfidfVectorizer(stop_words="english")
#     tfidf_matrix = tfidf.fit_transform(data["course_description"])

#     # Transform user input into TF-IDF space
#     skill_input_tfidf = tfidf.transform([skill_input])

#     # Calculate cosine similarity
#     cosine_similarities = cosine_similarity(skill_input_tfidf, tfidf_matrix).flatten()
#     recommended_courses_indices = cosine_similarities.argsort()[-n_recommendations:][::-1]

#     # Fetch the recommendations
#     recommendations = data.iloc[recommended_courses_indices][
#         ["course_name", "course_description", "course_rating", "course_url"]
#     ]
#     return recommendations

# # API endpoint to generate recommendations
# @app.route("/generate-recommendations", methods=["POST"])
# def generate_recommendations():
#     try:
#         # Get the email from the request
#         email = request.json.get("email")
#         if not email:
#             return jsonify({"error": "Email is required"}), 400

#         # Fetch the user's selectedItems list from MongoDB
#         user = users_collection.find_one({"email": email})
#         if not user:
#             return jsonify({"error": "User not found"}), 404

#         selected_items = user.get("selectedItems", [])
#         if not selected_items:
#             return jsonify({"error": "No preferences found for the user"}), 400

#         # Ensure randomness: Shuffle and pick one skill
#         random.shuffle(selected_items)
#         random_skill = random.choice(selected_items)

#         # Generate recommendations using the content-based recommendation function
#         recommendations = content_based_recommendation(random_skill)
#         recommendations_list = recommendations.to_dict(orient="records")

#         # Print recommendations to the console
#         print(f"Selected skill: {random_skill}")
#         print("Generated Recommendations:")
#         for rec in recommendations_list:
#             print(rec)

#         return jsonify({
#             "message": "Recommendations generated successfully",
#             "selected_skill": random_skill,
#             "recommendations": recommendations_list,
#         }), 200

#     except Exception as e:
#         return jsonify({"error": str(e)}), 500

# # Run the Flask app
# if __name__ == "__main__":
#     app.run(debug=True, host="0.0.0.0", port=5001)  # Use a different port to avoid conflict with app.js



#test 6


from flask import Flask, request, jsonify
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import pandas as pd
import os
import random
from pymongo import MongoClient

app = Flask(__name__)

# Path to the dataset
dataset_path = os.path.join(os.path.dirname(__file__), "new.csv")

# Load and preprocess dataset
if not os.path.exists(dataset_path):
    raise FileNotFoundError(f"Dataset not found at {dataset_path}")

try:
    data = pd.read_csv(dataset_path)

    # Standardize column names
    data.columns = [col.lower().replace(" ", "_") for col in data.columns]

    # Ensure required columns exist
    required_columns = ["course_name", "course_description", "course_rating", "course_url"]
    for column in required_columns:
        if column not in data.columns:
            raise ValueError(f"Missing required column: {column}")

    # Convert 'course_rating' to numeric and clean data
    data["course_rating"] = pd.to_numeric(data["course_rating"], errors="coerce")
    data = data.dropna(subset=["course_rating"])
except Exception as e:
    raise ValueError(f"Error processing dataset: {e}")

# MongoDB Connection
mongo_uri = "mongodb+srv://230701028:anan%400712@coderaiders.6j15f.mongodb.net/Evalora?retryWrites=true&w=majority"
client = MongoClient(mongo_uri)
db = client["Evalora"]
users_collection = db["users"]

# Cache the TF-IDF model and matrix
tfidf = TfidfVectorizer(stop_words="english")
tfidf_matrix = tfidf.fit_transform(data["course_description"])

# Content-Based Filtering Function
def content_based_recommendation(skill_input, n_recommendations=5):
    try:
        # Transform user input into TF-IDF space
        skill_input_tfidf = tfidf.transform([skill_input])

        # Calculate cosine similarity
        cosine_similarities = cosine_similarity(skill_input_tfidf, tfidf_matrix).flatten()
        recommended_indices = cosine_similarities.argsort()[-n_recommendations:][::-1]

        # Fetch the recommendations
        recommendations = data.iloc[recommended_indices][
            ["course_name", "course_description", "course_rating", "course_url"]
        ]
        return recommendations
    except Exception as e:
        print(f"Error in content-based recommendation: {e}")
        return pd.DataFrame()  # Return empty DataFrame in case of an error

# API Endpoint to Generate Recommendations
@app.route("/generate-recommendations", methods=["POST"])
def generate_recommendations():
    try:
        # Parse request data
        email = request.json.get("email", "").strip()
        if not email:
            return jsonify({"error": "Email is required"}), 400

        # Fetch user data from MongoDB
        user = users_collection.find_one({"email": email})
        if not user:
            return jsonify({"error": "User not found"}), 404

        selected_items = user.get("selectedItems", [])
        if not selected_items:
            return jsonify({"error": "No preferences found for the user"}), 400

        # Select a random skill from the user's preferences
        random.shuffle(selected_items)
        random_skill = random.choice(selected_items)

        # Generate recommendations
        recommendations = content_based_recommendation(random_skill)
        if recommendations.empty:
            return jsonify({"error": "No recommendations available"}), 404

        recommendations_list = recommendations.to_dict(orient="records")

        # Debugging Info
        print(f"User email: {email}")
        print(f"Selected skill: {random_skill}")
        print(f"Generated Recommendations: {recommendations_list}")

        return jsonify({
            "message": "Recommendations generated successfully",
            "selected_skill": random_skill,
            "recommendations": recommendations_list,
        }), 200

    except Exception as e:
        print(f"Error generating recommendations: {e}")
        return jsonify({"error": "Internal server error", "details": str(e)}), 500

# Test Endpoint
@app.route("/test", methods=["GET"])
def test():
    return jsonify({"message": "Backend is reachable!"}), 200

# Run the Flask App
if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5001)  # Use port 5001 to avoid conflicts
