from langchain_community.document_loaders import (
    UnstructuredPDFLoader, UnstructuredWordDocumentLoader
)

def load_documents(path):
    if path.endswith(".pdf"):
        loader = UnstructuredPDFLoader(path)
    elif path.endswith(".docx"):
        loader = UnstructuredWordDocumentLoader(path)
    else:
        raise ValueError("Unsupported file format")
    
    return loader.load()
