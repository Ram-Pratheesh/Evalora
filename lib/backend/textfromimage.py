import boto3

def extract_text_from_image(image_path):
    """
    Extract text from an image using AWS Textract.
    """
    # Initialize Textract client
    client = boto3.client('textract')

    # Read the image into memory
    with open(image_path, 'rb') as image_file:
        image_bytes = image_file.read()

    # Call Textract to detect text
    response = client.detect_document_text(Document={'Bytes': image_bytes})

    # Extract detected text
    detected_text = []
    for item in response['Blocks']:
        if item['BlockType'] == 'LINE':
            detected_text.append(item['Text'])

    # Combine text into a single string
    extracted_text = "\n".join(detected_text)
    return extracted_text

# Example usage
if __name__ == "__main__":
    # Path to your image
    image_path = "./totest1.jpeg"

    # Extract text from the image
    extracted_text = extract_text_from_image(image_path)

    # Display the extracted text
    print("Extracted Text:")
    print(extracted_text)
