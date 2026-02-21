from langchain_community.document_loaders import (
    UnstructuredWordDocumentLoader, UnstructuredPDFLoader
    )
from langchain_text_splitters import RecursiveCharacterTextSplitter
from langchain_huggingface import HuggingFaceEmbeddings
from langchain_community.vectorstores import FAISS
from dotenv import load_dotenv
import joblib

load_dotenv()

#load pdf
HANDBOOK_PATH = "data/csr_handbook.docx"
CHUNK_SIZE = 500
CHUNK_OVERLAP = 50

if HANDBOOK_PATH.endswith(".pdf"):
    loader = UnstructuredPDFLoader(HANDBOOK_PATH)
elif HANDBOOK_PATH.endswith(".docx"):
    loader = UnstructuredWordDocumentLoader(HANDBOOK_PATH)

docs = loader.load()

print(f"Original sectons loaded: {len(docs)}")

#chunking
text_splitter = RecursiveCharacterTextSplitter(
    chunk_size = CHUNK_SIZE,
    chunk_overlap = CHUNK_OVERLAP
)

chunks = text_splitter.split_documents(docs)
print(f"Total chunks created: {len(chunks)}")

embeddings = HuggingFaceEmbeddings(model_name="sentence-transformers/paraphrase-MiniLM-L3-v2")

#embed chunking
vectorstore = FAISS.from_documents(chunks, embeddings)
vectorstore.save_local("vector_store")
print("Vector store saved successfully!")

classifier = joblib.load("intent_classifier.pkl")

while True:
    query = input("Your handbook question (Type 'exit' or 'quit' to end chat): ").strip().lower()

    query_vector = embeddings.embed_query(query)

    if query in ["exit", "quit"]:
        print("Exiting the chatbot...")
        break

    predicted_intent = classifier.predict([query_vector])[0]
    results = vectorstore.similarity_search(query, k=5)  
    best_result = results[0].page_content
    
    print("\nAI Assistant:")

    print("\n--- Search Results ---")
    for i, result in enumerate(results, 1):
        print(f"\nBased on the CSR Handbook, here is the information regarding '{predicted_intent}': \n{i}. {result.page_content[:600]}")

