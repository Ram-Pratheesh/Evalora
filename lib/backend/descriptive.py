# import streamlit as st
# from PyPDF2 import PdfReader
# from langchain.text_splitter import RecursiveCharacterTextSplitter
# import os
# from langchain_google_genai import GoogleGenerativeAIEmbeddings
# import google.generativeai as genai
# from langchain.vectorstores import FAISS
# from langchain_google_genai import ChatGoogleGenerativeAI
# from langchain.chains.question_answering import load_qa_chain
# from langchain.prompts import PromptTemplate
# from dotenv import load_dotenv
# import uuid
# from PIL import Image
# import boto3
# import json
# from sklearn.feature_extraction.text import TfidfVectorizer
# from sklearn.metrics.pairwise import cosine_similarity

# # Load environment variables
# load_dotenv()

# # AWS Textract client
# textract_client = boto3.client('textract', region_name=os.getenv("AWS_REGION"))


# def get_pdf_text(pdf_docs):
#     text = ""
#     for pdf in pdf_docs:
#         pdf_reader = PdfReader(pdf)
#         for page in pdf_reader.pages:
#             text += page.extract_text()
#     return text


# def get_text_chunks(text):
#     text_splitter = RecursiveCharacterTextSplitter(chunk_size=10000, chunk_overlap=1000)
#     chunks = text_splitter.split_text(text)
#     return chunks


# def generate_descriptive_questions(text_chunks, num_questions=5):
#     context = text_chunks[0] if text_chunks else "No context available."
#     messages = [
#         {"role": "system", "content": "You are an intelligent assistant tasked with creating descriptive questions."},
#         {"role": "user", "content": f"Generate {num_questions} descriptive questions from the following context:\n\n{context}"}
#     ]
#     model = ChatGoogleGenerativeAI(model="gemini-1.5-pro-002", temperature=0.3)

#     try:
#         response = model.invoke(messages)
#         questions_text = response.content
#         questions = questions_text.split("\n")
#         parsed_questions = [line.strip() for line in questions if line.strip() and line[0].isdigit()]
#         return parsed_questions
#     except Exception as e:
#         st.error(f"An error occurred while generating questions: {e}")
#         return []


# def get_conversational_chain():
#     prompt_template = """
#     Answer the question as detailed as possible from the provided context, make sure to provide all the details, if the answer is not in
#     provided context just say, "answer is not available in the context", don't provide the wrong answer\n\n
#     Context:\n {context}?\n
#     Question: \n{question}\n

#     Answer:
#     """
#     model = ChatGoogleGenerativeAI(model="gemini-1.5-flash-002", temperature=0.3)
#     prompt = PromptTemplate(template=prompt_template, input_variables=["context", "question"])
#     chain = load_qa_chain(model, chain_type="stuff", prompt=prompt)
#     return chain


# def generate_model_answers(text_chunks, questions):
#     embeddings = GoogleGenerativeAIEmbeddings(model="models/embedding-001")
#     new_db = FAISS.load_local("C://ani//1777//coderaiders//coderaiders//lib//backend//faiss_index//index.faiss", embeddings, allow_dangerous_deserialization=True)

#     chain = get_conversational_chain()
#     model_answers = {}

#     for question in questions:
#         docs = new_db.similarity_search(question)
#         response = chain({"input_documents": docs, "question": question}, return_only_outputs=True)
#         model_answers[question] = response.get("output_text", "No answer available.")
#     return model_answers


# def save_images_on_submit(uploaded_files):
#     image_paths = []
#     os.makedirs("uploaded_images", exist_ok=True)

#     for uploaded_file in uploaded_files:
#         image_id = str(uuid.uuid4())
#         file_path = f"uploaded_images/{image_id}_{uploaded_file.name}"
#         with open(file_path, "wb") as f:
#             f.write(uploaded_file.getbuffer())
#         image_paths.append(file_path)
#     return image_paths


# def extract_text_from_images_to_single_file(image_folder, output_file):
#     os.makedirs(os.path.dirname(output_file), exist_ok=True)
#     combined_text = []

#     for image_file in os.listdir(image_folder):
#         image_path = os.path.join(image_folder, image_file)
#         if not image_file.lower().endswith(("png", "jpg", "jpeg")):
#             continue

#         with open(image_path, 'rb') as img_file:
#             image_bytes = img_file.read()
#             response = textract_client.detect_document_text(Document={'Bytes': image_bytes})

#         for block in response.get('Blocks', []):
#             if block.get('BlockType') == 'LINE':
#                 combined_text.append(block.get('Text', ''))

#     with open(output_file, 'w', encoding='utf-8') as f:
#         f.write("\n".join(combined_text))
#     return output_file


# def parse_combined_answers_to_json(input_file, output_file):
#     answers = {}
#     with open(input_file, 'r', encoding='utf-8') as f:
#         lines = f.readlines()

#     for line in lines:
#         line = line.strip()
#         if line.startswith("Q") and ":" in line:
#             key, value = line.split(":", 1)
#             answers[key.strip()] = value.strip()

#     with open(output_file, 'w', encoding='utf-8') as f:
#         json.dump(answers, f, indent=4)


# def reformat_model_answers_to_simple_json(input_file, output_file):
#     with open(input_file, 'r', encoding='utf-8') as f:
#         model_answers = json.load(f)

#     reformatted_answers = {}
#     for idx, answer in enumerate(model_answers.values(), start=1):
#         reformatted_answers[f"Q{idx}"] = answer

#     with open(output_file, 'w', encoding='utf-8') as f:
#         json.dump(reformatted_answers, f, indent=4)


# def evaluate_answers(user_answers_file, model_answers_file):
#     with open(user_answers_file, 'r', encoding='utf-8') as f:
#         user_answers = json.load(f)

#     with open(model_answers_file, 'r', encoding='utf-8') as f:
#         model_answers = json.load(f)

#     vectorizer = TfidfVectorizer()
#     scores = {}
#     total_score = 0

#     for question_id, model_answer in model_answers.items():
#         user_answer = user_answers.get(question_id, "")

#         # Vectorize the answers and compute cosine similarity
#         vectors = vectorizer.fit_transform([model_answer, user_answer])
#         similarity = cosine_similarity(vectors[0], vectors[1])[0][0]

#         # Scale the similarity to marks out of 20
#         marks = round(similarity * 20, 2)
#         scores[question_id] = {"marks": marks, "similarity": round(similarity * 100, 2)}
#         total_score += marks

#     total_score = min(total_score, 100)  # Cap at 100
#     return {"scores": scores, "total_score": round(total_score, 2)}


# def main():
#     st.set_page_config("Chat PDF", layout="wide")
#     st.header("Chat with PDF and Generate Assessment 💁")

#     with st.sidebar:
#         st.title("Menu:")
#         pdf_docs = st.file_uploader("Upload your PDF Files", accept_multiple_files=True)
#         generate_questions = st.checkbox("Generate Descriptive Questions and Model Answers")
#         if st.button("Submit & Process"):
#             with st.spinner("Processing..."):
#                 raw_text = get_pdf_text(pdf_docs)
#                 text_chunks = get_text_chunks(raw_text)
#                 st.session_state["text_chunks"] = text_chunks
#                 st.success("Processing Completed!")

#                 if generate_questions:
#                     questions = generate_descriptive_questions(text_chunks)
#                     st.session_state["questions"] = questions

#                     model_answers = generate_model_answers(text_chunks, questions)
#                     st.session_state["model_answers"] = model_answers

#                     with open("model_answers.json", "w", encoding="utf-8") as f:
#                         json.dump(model_answers, f, indent=4)

#                     reformat_model_answers_to_simple_json("model_answers.json", "reformatted_model_answers.json")
#                     st.success("Model answers reformatted and saved.")

#     if "questions" in st.session_state:
#         st.subheader("Generated Descriptive Questions")
#         for i, question in enumerate(st.session_state["questions"], 1):
#             st.write(f"Q{i}: {question}")

#     st.subheader("Upload Answers")
#     uploaded_files = st.file_uploader(
#         "Upload images of your handwritten answers",
#         accept_multiple_files=True,
#         type=["png", "jpg", "jpeg"]
#     )

#     if uploaded_files:
#         st.image([Image.open(file) for file in uploaded_files], caption=[file.name for file in uploaded_files], use_container_width=True)

#     if st.button("Submit Answers for Processing"):
#         if not uploaded_files:
#             st.warning("Please upload images before clicking submit.")
#         else:
#             with st.spinner("Processing uploaded images..."):
#                 image_paths = save_images_on_submit(uploaded_files)
#                 output_file = "extracted_texts/combined_answers.txt"
#                 result_file = extract_text_from_images_to_single_file("uploaded_images", output_file)
#                 st.success(f"Text extracted and saved in: {result_file}")

#                 parsed_json_file = "parsed_answers.json"
#                 parse_combined_answers_to_json(result_file, parsed_json_file)
#                 st.success(f"Parsed answers saved as {parsed_json_file}.")

#                 with open(parsed_json_file, 'r', encoding='utf-8') as f:
#                     parsed_answers = json.load(f)
#                 st.subheader("Parsed Answers in JSON Format")
#                 st.json(parsed_answers)

#     if st.button("Evaluate Answers"):
#         with st.spinner("Evaluating answers..."):
#             evaluation_results = evaluate_answers("parsed_answers.json", "reformatted_model_answers.json")

#             st.subheader("Evaluation Results")
#             for question, result in evaluation_results["scores"].items():
#                 st.write(f"{question}:** {result['marks']} marks ({result['similarity']}% similarity)")

#             st.write("### Total Score:", evaluation_results["total_score"], "/ 100")


# if __name__ == "__main__":
#     main()

from flask import Flask, request, jsonify
from PyPDF2 import PdfReader
from langchain.text_splitter import RecursiveCharacterTextSplitter
import os
from langchain_google_genai import GoogleGenerativeAIEmbeddings
import google.generativeai as genai
from langchain_community.vectorstores import FAISS
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain.chains.question_answering import load_qa_chain
from langchain.prompts import PromptTemplate
from dotenv import load_dotenv
import uuid
from PIL import Image
import boto3
import json
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

# Initialize Flask app
app = Flask(__name__)

# Load environment variables
load_dotenv()

# AWS Textract client
textract_client = boto3.client('textract', region_name=os.getenv("AWS_REGION"))

# Function to get text from PDF
def get_pdf_text(pdf_docs):
    text = ""
    for pdf in pdf_docs:
        pdf_reader = PdfReader(pdf)
        for page in pdf_reader.pages:
            text += page.extract_text()
    return text

# Function to split text into chunks
def get_text_chunks(text):
    text_splitter = RecursiveCharacterTextSplitter(chunk_size=10000, chunk_overlap=1000)
    chunks = text_splitter.split_text(text)
    return chunks

# Function to generate descriptive questions
def generate_descriptive_questions(text_chunks, num_questions=5):
    context = text_chunks[0] if text_chunks else "No context available."
    messages = [
        {"role": "system", "content": "You are an intelligent assistant tasked with creating descriptive questions."},
        {"role": "user", "content": f"Generate {num_questions} descriptive questions from the following context:\n\n{context}"}
    ]
    model = ChatGoogleGenerativeAI(model="gemini-1.5-pro-002", temperature=0.3)

    try:
        response = model.invoke(messages)
        questions_text = response.content
        questions = questions_text.split("\n")
        parsed_questions = [line.strip() for line in questions if line.strip() and line[0].isdigit()]
        return parsed_questions
    except Exception as e:
        return {"error": f"An error occurred while generating questions: {str(e)}"}

# Function to get conversational chain
def get_conversational_chain():
    prompt_template = """
    Answer the question as detailed as possible from the provided context, make sure to provide all the details, if the answer is not in
    provided context just say, "answer is not available in the context", don't provide the wrong answer\n\n
    Context:\n {context}?\n
    Question: \n{question}\n

    Answer:
    """
    model = ChatGoogleGenerativeAI(model="gemini-1.5-flash-002", temperature=0.3)
    prompt = PromptTemplate(template=prompt_template, input_variables=["context", "question"])
    chain = load_qa_chain(model, chain_type="stuff", prompt=prompt)
    return chain

# Function to generate answers from the model
def generate_model_answers(text_chunks, questions):
    embeddings = GoogleGenerativeAIEmbeddings(model="models/embedding-001")
    new_db = FAISS.load_local("faiss_index", embeddings, allow_dangerous_deserialization=True)

    chain = get_conversational_chain()
    model_answers = {}

    for question in questions:
        docs = new_db.similarity_search(question)
        response = chain({"input_documents": docs, "question": question}, return_only_outputs=True)
        model_answers[question] = response.get("output_text", "No answer available.")
    return model_answers

# Function to save uploaded images on submit
def save_images_on_submit(uploaded_files):
    image_paths = []
    os.makedirs("uploaded_images", exist_ok=True)

    for uploaded_file in uploaded_files:
        image_id = str(uuid.uuid4())
        file_path = f"uploaded_images/{image_id}_{uploaded_file.filename}"
        with open(file_path, "wb") as f:
            f.write(uploaded_file.read())
        image_paths.append(file_path)
    return image_paths

# Function to extract text from images
def extract_text_from_images_to_single_file(image_folder, output_file):
    os.makedirs(os.path.dirname(output_file), exist_ok=True)
    combined_text = []

    for image_file in os.listdir(image_folder):
        image_path = os.path.join(image_folder, image_file)
        if not image_file.lower().endswith(("png", "jpg", "jpeg")):
            continue

        with open(image_path, 'rb') as img_file:
            image_bytes = img_file.read()
            response = textract_client.detect_document_text(Document={'Bytes': image_bytes})

        for block in response.get('Blocks', []):
            if block.get('BlockType') == 'LINE':
                combined_text.append(block.get('Text', ''))

    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("\n".join(combined_text))
    return output_file

# Function to evaluate answers
def evaluate_answers(user_answers_file, model_answers_file):
    with open(user_answers_file, 'r', encoding='utf-8') as f:
        user_answers = json.load(f)

    with open(model_answers_file, 'r', encoding='utf-8') as f:
        model_answers = json.load(f)

    vectorizer = TfidfVectorizer()
    scores = {}
    total_score = 0

    for question_id, model_answer in model_answers.items():
        user_answer = user_answers.get(question_id, "")

        # Vectorize the answers and compute cosine similarity
        vectors = vectorizer.fit_transform([model_answer, user_answer])
        similarity = cosine_similarity(vectors[0], vectors[1])[0][0]

        # Scale the similarity to marks out of 20
        marks = round(similarity * 20, 2)
        scores[question_id] = {"marks": marks, "similarity": round(similarity * 100, 2)}
        total_score += marks

    total_score = min(total_score, 100)  # Cap at 100
    return {"scores": scores, "total_score": round(total_score, 2)}

# Define the API endpoints
@app.route('/process_pdf', methods=['POST'])
def process_pdf():
    if 'pdf' not in request.files:
        return jsonify({"error": "No file part"}), 400

    uploaded_files = request.files.getlist('pdf')
    raw_text = get_pdf_text(uploaded_files)
    text_chunks = get_text_chunks(raw_text)
    return jsonify({"text_chunks": text_chunks}), 200

@app.route('/generate_questions', methods=['POST'])
def generate_questions():
    data = request.get_json()
    text_chunks = data.get("text_chunks", [])
    questions = generate_descriptive_questions(text_chunks)
    return jsonify({"questions": questions}), 200

@app.route('/generate_answers', methods=['POST'])
def generate_answers():
    data = request.get_json()
    text_chunks = data.get("text_chunks", [])
    questions = data.get("questions", [])
    model_answers = generate_model_answers(text_chunks, questions)
    return jsonify({"model_answers": model_answers}), 200

@app.route('/evaluate_answers', methods=['POST'])
def evaluate_user_answers():
    data = request.get_json()
    user_answers = data.get("user_answers", [])
    model_answers = data.get("model_answers", [])
    
    user_answers_file = "user_answers.json"
    model_answers_file = "model_answers.json"
    
    with open(user_answers_file, 'w', encoding='utf-8') as f:
        json.dump(user_answers, f, indent=4)
        
    with open(model_answers_file, 'w', encoding='utf-8') as f:
        json.dump(model_answers, f, indent=4)
        
    evaluation_results = evaluate_answers(user_answers_file, model_answers_file)
    return jsonify(evaluation_results), 200

# Run the Flask app
# Run the Flask app
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5007, debug=True)
